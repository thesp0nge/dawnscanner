module Codesake
  module Dawn
    module Kb
      module PatternMatchCheck
        include BasicCheck

        attr_reader   :target_version
        attr_reader   :fixes_version
        attr_reader   :attack_pattern
        attr_reader   :name
        attr_reader   :hits
        attr_accessor :lines

        def initialize(options={})
          super(options)

          @target_version = options[:target_version]
          @fixes_version  = options[:fixes_version]
          @attack_pattern = options[:attack_pattern]
          @name           = options[:name]
          @lines          = options[:lines]  
          @hits           =[]
        end

        def load_file(filename)
          return nil unless File.exists?(filename)

          f = File.open(filename)
          @lines = f.readlines
          f.close 
          

          @lines
        end

        def load_lines(lines)
          @lines = lines
        end


        def run(attack_pattern = nil)
          attack_pattern = @attack_pattern if attack_pattern.nil?

          return [] if @lines.nil? or @lines.empty?

          regex=/#{attack_pattern}/

            @lines.each_with_index do |line,i|
            @hits << {:match=>line, :line=>i} unless (regex =~ line).nil?
            end

          @hits
        end

        def vuln?
          run
          return ! @hits.empty?
           

        end


      end
    end
  end
end
