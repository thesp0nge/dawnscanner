module Codesake
  module Dawn
    module Kb
      module DependencyCheck
        include BasicCheck

        attr_accessor :dependencies
        attr_accessor :fixed_dependency

        def vuln?
          ret = false
          @dependencies.each do |dep|
            if dep[:name] == @fixed_dependency[:name] and is_vulnerable_version?(dep[:version], @fixed_dependency[:version]) 
              ret = true
              self.evidences << "Vulnerable #{dep[:name]} gem version found: #{dep[:version]}"
            end
          end
          ret
        end
      end
    end
  end
end
