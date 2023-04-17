module Dawn
  module Kb
    # While working on the KB rebase, fetching data from NVD API, I suddenly
    # realize I must change the way a vulnerable dependency must be handled.
    # Instead of changing what is working right now, I'll add a new dependency
    # check ruby class
    # NVD bulletins lists versions that are vulnerable and it would break
    # automatism adding a post data fetching step to realize which is the first
    # safe version.
    #
    # This class will handle a dependency name, the version found in
    # Gemfile.lock and an array of vulnerable versions. If the version found is
    # in the array, than the vuln? method returns true.
    # This is an approach far more easy rathern than the one chosen in the past.
    class UnsafeDependencyCheck
      include BasicCheck

      attr_accessor :dependencies
      attr_accessor :vulnerable_version_array

      def initialize(options)
        super(options)
      end

      def vuln?
        ret = false

        # 20210325: I know... a single check handles a single dependency so,
        # this should not be an array. This involves too many underlying
        # changes one day I'll make.
        @dependencies.each do |dep|
          unless @vulnerable_version_array.nil? or @vulnerable_version_array.empty?
            if dep[:name] == @vulnerable_version_array[0][:name]

              puts @vulnerable_version_array[0]
              unless @vulnerable_version_array[0][:versionEndIncluding].nil?
                if (Gem::Version.new(dep[:version]) > Gem::Version.new(@vulnerable_version_array[0][:versionEndIncluding]))
                  return false
                else
                  return true
                end
              end

              unless @vulnerable_version_array[0][:versionEndExcluding].nil?
                if (Gem::Version.new(dep[:version]) >= Gem::Version.new(@vulnerable_version_array[0][:versionEndExcluding]))
                  return false
                else
                  return true
                end
              end
              return true   if @please_ignore_dep_version
              return false  if @vulnerable_version_array[0][:version].nil? or @vulnerable_version_array[0][:version].empty?
              return true   if @vulnerable_version_array[0][:version].include? dep[:version]
            end
          end
        end

        return false
      end
    end
  end
end
