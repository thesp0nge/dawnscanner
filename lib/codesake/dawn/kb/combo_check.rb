module Codesake
  module Dawn
    module Kb
      module ComboCheck
        include BasicCheck

        attr_reader   :checks
        attr_accessor :options
        attr_reader   :vulnerable_checks


        def initialize(options={})
          super(options)
          @vuln_if_all_fails = true
          @vuln_if_all_fails = options[:vuln_if_all_fails] unless options[:checks].nil?
          @checks = options[:checks]
          @vulnerable_checks = []
        end

        def vuln?
          ret = true
          at_least_one = false
          @checks.each do |check|
            check_vuln = false
            check.detected_ruby   = @options[:detected_ruby]    if check.kind == Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK
            check.dependencies    = @options[:dependencies]     if check.kind == Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
            check.root_dir        = @options[:root_dir]         if check.kind == Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK

            check_vuln = check.vuln? if check.respond_to?(:vuln?)

            ret = ret && check_vuln
            at_least_one = true if check_vuln
            @evidences << check.evidences if check_vuln 
            @vulnerable_checks << check if check_vuln
            raise "A check class doesn't respond to vuln? in combo (#{check.class})" unless check.respond_to?(:vuln?)
          end

          dump_status
          $logger.log("V: #{@vuln_if_all_fails}, R: #{ret}, A:#{at_least_one}")
          return ret if @vuln_if_all_fails
          return at_least_one unless @vuln_if_all_fails
        end

        def dump_status
          @checks.each do |check|
            $logger.log("#{check.name}: #{check.status}")
          end

          true
        end

        def self.find_vulnerable_checks_by_class(list=[], klass=Object)
          list.each do |l|
            return l if l.instance_of?(klass)
          end
          nil
        end

      end
    end
  end
end
