module Codesake
  module Dawn
    class Reporter

      def initialize(options={})
        @format = :txt
        @engine = nil
        @ret = false

        @ret = options[:apply_all_code] unless options[:apply_all_code].nil?
        @format = options[:format] unless options[:format].nil?
        @engine = options[:engine] unless options[:engine].nil?

      end

      def report
        ascii_tabular_report  if @format == :tabular
        json_report           if @format == :json
      end
      private
      def ascii_tabular_report

        # 0_First table: executive summary
        rows = []
        rows << ['Dawn version', Codesake::Dawn::VERSION] unless Codesake::Dawn::RELEASE == "(development)"
        rows << ['Dawn development version', Codesake::Dawn::VERSION] if Codesake::Dawn::RELEASE == "(development)"
        rows << ['Scan started', @engine.scan_start]
        rows << ['Scan duration', "#{@engine.scan_time.round(3)} sec"]
        rows << ['Target', @engine.target]
        rows << ['MVC detected framework', "#{@engine.name} v#{@engine.get_mvc_version}" ] unless @engine.name == "Gemfile.lock"
        rows << ['MVC detected framework', "#{@engine.force} v#{@engine.get_mvc_version}" ] if @engine.name == "Gemfile.lock"
        if @ret
          rows << ['Applied checks', "#{@engine.applied_checks} security checks"]
          rows << ['Skipped checks', "#{@engine.skipped_checks} security checks"]
        else
          rows << ['Applied checks', "No security checks in the knowledge base"]
        end
        rows << ['Vulnerabilities found', @engine.count_vulnerabilities]
        rows << ['Mitigated issues found', @engine.mitigated_issues.count]
        rows << ['Reflected XSS', @engine.reflected_xss.count] 
        table = Terminal::Table.new :title=>'Scan summary', :rows => rows
        puts table


        if @engine.count_vulnerabilities > 0

          # 1_Vulnerabilities
          rows = []
          @engine.vulnerabilities.each do |vuln|
            rows << [vuln[:name].justify(10), vuln[:message].justify(50), vuln[:remediation].justify(15), vuln[:evidences].join.justify(15)]
            rows << :separator
          end
          table = Terminal::Table.new :title=>"Vulnerabilities", :headings=>['Issue', 'Description', 'Solution', 'Evidences'], :rows=>rows
          puts table

          rows = []
          if @engine.has_reflected_xss?
            @engine.reflected_xss.each do |vuln|
              rows << [vuln[:sink_source], vuln[:sink_view], "#{vuln[:sink_file]}@#{vuln[:sink_line]}",vuln[:sink_evidence]]
              rows << :separator
            end
            table = Terminal::Table.new :title=>"Reflected Cross Site Scripting", :headings=>['Sink name', 'View', 'Location the sink was read', 'Evidences'], :rows=>rows
            puts table

          end

        end

        if @engine.mitigated_issues.count > 0
          # 2_Mitigated issues
          rows = []
          @engine.mitigated_issues.each do |vuln|
            rows << [vuln[:name].justify(10), vuln[:message].justify(50), vuln[:evidences].join.justify(15)]
            rows << :separator
          end
          table = Terminal::Table.new :title=>"Mitigated issues", :headings=>['Issue', 'Description', 'Evidences'], :rows=>rows
          puts table
        end
      end


      def json_report
        result = {}
        return {:status=>"KO", :message=>"BUG at #{__FILE__}@#{__LINE__}: target is empty or engine is nil."}.to_json if @engine.target.empty? or @engine.nil?
        return {:status=>"KO", :message=>"#{target} doesn't exist"}.to_json if ! Dir.exist?(@engine.target)
        return {:status=>"KO", :message=>"no security checks applied"}.to_json unless @ret

        result[:status]="OK"
        result[:dawn_version] = Codesake::Dawn::VERSION
        result[:dawn_status] = "Develoment version" if Codesake::Dawn::RELEASE == "(development)"
        result[:scan_started] = @engine.scan_start
        result[:scan_duration] = "#{@engine.scan_time.round(3)} sec"
        result[:target]=@engine.target
        result[:mvc]=@engine.name unless @engine.name == "Gemfile.lock"
        result[:mvc]=@engine.force if @engine.name == "Gemfile.lock"
        result[:mvc_version]=@engine.get_mvc_version

        result[:applied_checks_count] = @engine.applied_checks
        result[:skipped_checks_count] = @engine.skipped_checks
        result[:vulnerabilities_count]=@engine.count_vulnerabilities

        result[:mitigated_issues_count] = @engine.mitigated_issues.count
        result[:reflected_xss_count] = @engine.reflected_xss.count
        result[:vulnerabilities]=[]
        @engine.vulnerabilities.each do |v|
          result[:vulnerabilities] << v[:name]
        end
        result[:mitigated_vuln] = @engine.mitigated_issues
        result[:reflected_xss] = []
        @engine.reflected_xss.each do |r|
          result[:reflected_xss] << "request parameter \"#{r[:sink_source]}\""
        end

        puts result.to_json
      end 
    end
  end
end
