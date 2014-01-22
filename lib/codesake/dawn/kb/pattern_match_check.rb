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

        # This attribute is false by default. If true, it tells pattern
        # matching check to ignore strings starting with the ruby single line
        # comment separator, '#'.
        attr_reader   :avoid_comments

        EXCLUSION_LIST = [
          "tags",
          "vendor/bundle", 
          "features",
          "specs",
          "test"
        ]

        def initialize(options={})
          super(options)
          @negative_search  = false
          @avoid_comments = false
          @attack_pattern   = options[:attack_pattern] unless options[:attack_pattern].nil?
          @negative_search  = options[:negative_search] unless options[:negative_search].nil? 
          @avoid_comments  = options[:avoid_comments] unless options[:avoid_comments].nil? 
          @glob = "**"
          @glob = File.join(@glob, options[:glob]) unless options[:glob].nil?
        end

        def must_exclude?(filename)
          EXCLUSION_LIST.each do |ex|
            debug_me "skipping #{filename}" if filename.start_with?(ex)
            return true if filename.start_with?(ex)
          end
          return false
        end

        def vuln?
          Dir.glob(File.join("#{root_dir}", @glob)).each do |filename|
            debug_me("#{File.basename(__FILE__)}@#{__LINE__}: analyzing #{filename}: search is #{@negative_search}")
            matches = []
            begin
              matches = run(load_file(filename)) if File.exists?(filename) && File.file?(filename) && ! File.binary?(filename) && ! must_exclude?(filename)
            rescue ArgumentError => e
              puts "Skipping pattern match check for #{filename}: #{e.message}"
            end
            @evidences << {:filename=>filename, :matches=>matches} unless matches.empty?
          end
         
          ret_value = ! @evidences.empty? unless @negative_search
          ret_value = @evidences.empty? if @negative_search

          debug_me("#{File.basename(__FILE__)}@#{__LINE__}: evidences #=> #{@evidences}")
          debug_me("#{File.basename(__FILE__)}@#{__LINE__}: ret_value #=> #{ret_value}")

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

            debug_me "@avoid_comments is #{@avoid_comments}"

            lines.each_with_index do |line,i|
              debug_me "Line is a comment (#{line})" if line.strip.start_with?('#')
              line = "" if line.strip.start_with?('#') && @avoid_comments
              debug_me "Line is empty" if line.empty?
              hits << {:match=>line, :line=>i} unless (regex =~ line).nil?
            end
          end

          hits
        end

      end
    end
  end
end
