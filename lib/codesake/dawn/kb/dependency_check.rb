module Codesake
  module Dawn
    module Kb
      module DependencyCheck
        include BasicCheck

        attr_accessor :dependencies
        attr_accessor :fixed_dependency

        def vuln?
          @dependencies.each do |dep|
            return true if dep[:name] == @fixed_dependency[:name] and is_vulnerable_version?(dep[:version], @fixed_dependency[:version])
          end
          false
        end
      end
    end
  end
end
