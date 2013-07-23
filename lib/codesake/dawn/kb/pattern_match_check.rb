require 'ptools'

module Codesake
  module Dawn
    module Kb
      module PatternMatchCheck
        include BasicCheck


        attr_reader   :attack_pattern
        attr_accessor :root_dir

        # This attribute is false by default. If true, the vuln? method check
        # if pattern attack is nor present.
        attr_reader   :negative_search

        def initialize(options={})
          super(options)
          @attack_pattern   = options[:attack_pattern]
          @negative_search  = false
          @negative_search  = options[:negative_search] unless options[:negative_search].nil? 
          @glob = "**"
          @glob = File.join(@glob, options[:glob]) unless options[:glob].nil?
        end

        def vuln?
          Dir.glob(File.join("#{root_dir}", @glob)).each do |filename|
            $logger.log("#{File.basename(__FILE__)}@#{__LINE__}: analyzing #{filename}: search is #{@negative_search}") if @debug
            matches = []
            begin
              matches = run(load_file(filename)) if File.exists?(filename) and File.file?(filename) and ! File.binary?(filename)
            rescue ArgumentError => e
              puts "Skipping pattern match check for #{filename}: #{e.message}"
            end
            @evidences << {:filename=>filename, :matches=>matches} unless matches.empty?
          end
         
          ret_value = ! @evidences.empty? unless @negative_search
          ret_value = @evidences.empty? if @negative_search

          $logger.log("#{File.basename(__FILE__)}@#{__LINE__}: evidences #=> #{@evidences}") if @debug
          $logger.log("#{File.basename(__FILE__)}@#{__LINE__}: ret_value #=> #{ret_value}") if @debug

          @status = ret_value

          return ret_value
        end

        private 
        def string_to_array(par)
          return par if par.class == Array
          %w(par)  
        end

        def load_file(filename)

          f = File.open(filename)
          lines = f.readlines
          f.close 

          lines
        end

        def run(lines)
          hits = []

          patterns = string_to_array(@attack_pattern)
          
          patterns.each do |pat|

            regex=/#{pat}/

            lines.each_with_index do |line,i|
              hits << {:match=>line, :line=>i} unless (regex =~ line).nil?
            end
          end

          hits
        end

      end
    end
  end
end
