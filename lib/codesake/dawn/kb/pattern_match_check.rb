require 'ptools'

module Codesake
  module Dawn
    module Kb
      module PatternMatchCheck
        include BasicCheck


        attr_reader   :attack_pattern
        attr_accessor :root_dir

        def initialize(options={})
          super(options)
          @attack_pattern = options[:attack_pattern]
          @glob = "*"
          @glob = options[:glob] unless options[:glob].nil?
        end

        def vuln?
          Dir.glob(File.join("#{root_dir}", @glob)).each do |filename|
            matches = []
            begin
              matches = run(load_file(filename)) if File.exists?(filename) and File.file?(filename) and ! File.binary?(filename)
            rescue ArgumentError => e
              puts "Skipping pattern match check for #{filename}: #{e.message}"
            end
            @evidences << {:filename=>filename, :matches=>matches} unless matches.empty?
          end
          return ! @evidences.empty?
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
