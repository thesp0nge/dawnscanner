module Codesake
  module Dawn
    module Kb
      class BasicCheck

        attr_reader   :target_version
        attr_reader   :fixes_version
        attr_reader   :attack_pattern
        attr_reader   :name
        attr_accessor :lines

        def initialize(options={})

          @target_version = options[:target_version]
          @fixes_version  = options[:fixes_version]
          @attack_pattern = options[:attack_pattern]
          @name           = options[:name]
          @lines          = options[:lines]  
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
          hits=[]

          regex=/#{attack_pattern}/

            @lines.each_with_index do |line,i|
            hits << {:match=>line, :line=>i} unless (regex =~ line).nil?
            end

          hits
        end


        # @target_version = '2.3.11'
        # @fixes_version = ['2.3.18', '3.2.13', '3.1.12' ] 
        def is_vulnerable_version?(target = nil, fixes = nil)
          target  = @target_version if target.nil?
          fixes   = @fixes_version  if fixes.nil?
          return false if target.nil? or fixes.empty?

          ret = false

          target_v_array = target.split(".").map! { |n| n.to_i }
          fixes.each do |fv|
            fixes_v_array = fv.split(".").map! { |n| n.to_i }
            if target_v_array[0] == fixes_v_array[0]
              ret = true if target_v_array[1] < fixes_v_array[1] # same major but previous minor
              ret = true if target_v_array[1] == fixes_v_array[1] and target_v_array[2] < fixes_v_array[2] 
            end
          end

          ret
        end
      end
    end
  end
end
