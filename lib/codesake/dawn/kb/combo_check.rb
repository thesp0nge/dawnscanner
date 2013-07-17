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
          @checks = options[:checks]
          @vulnerable_checks = []
        end

        def vuln?
          ret = true
          @checks.each do |check|
            check_vuln = false
            check.detected_ruby   = @options[:detected_ruby]    if check.kind == Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK
            check.dependencies    = @options[:dependencies]     if check.kind == Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
            check.root_dir        = @options[:root_dir]         if check.kind == Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK

            check_vuln = check.vuln? if check.respond_to?(:vuln?)

            ret = ret && check_vuln
            @evidences << check.evidences if check_vuln 
            @vulnerable_checks << check if check_vuln
            raise "A check class doesn't respond to vuln? in combo (#{check.class})" unless check.respond_to?(:vuln?)
          end

          ret
        end

      end
    end
  end
end
