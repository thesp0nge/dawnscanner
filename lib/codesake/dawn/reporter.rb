module Codesake
  module Dawn
    class Reporter

      def initialize(options={})
        @engine = nil
        @ret = false

        @filename = options[:filename]
        @ret = options[:apply_all_code] unless options[:apply_all_code].nil?
        @format = options[:format] unless options[:format].nil?
        @engine = options[:engine] unless options[:engine].nil?

        @format = :console unless is_valid_format?(@format)
      end

      def report
        ascii_tabular_report  if @format == :tabular
        json_report           if @format == :json
        ascii_plain_report    if @format == :console
        html_report           if @format == :html
      end
      private

      def write(output)

        puts output if @filename.nil?

        unless @filename.nil?
          $logger.warn "I will use codesake.css, bootstrap.min.css and bootstrap.js stored in ./support/ directory" if @format == :html
          File.open(@filename, "w") do |f|
            f.puts output
          end
          $logger.ok "#{@filename} created (#{output.length} bytes)"
        end
      end
      def is_valid_format?(format)
        return false if format.nil?
        return true if (format == :console) || (format == :tabular) || (format == :json) || (format == :html) || (format == :csv)
        return false # otherwise
      end

      def html_report
        html_head = "<!doctype html><html><head><title>Codesake::Dawn report for #{File.basename(@engine.target)}</title>"
        html_head += "<script src=\"./support/bootstrap.js\"></script>"
        html_head += "<link href=\"./support/codesake.css\" media=\"all\" rel=\"stylesheet\" />"
        html_head += "<link href=\"./support/bootstrap.min.css\" media=\"all\" rel=\"stylesheet\" />"
        html_head += "</head>"
        html_body =  "<body>"
        html_body +=  ""
        html_body += "<div id=\"wrap\">"
        html_body += "<div class=\"container-narrow\">"
        html_body += "<div class=\"masthead\">"
        html_body += "<ul class=\"nav nav-pills pull-right\">"
        html_body += "<li class=\"\"><a href=\"https://dawn.codesake.com\">Home</a></li>"
        html_body += "<li class=\"active\"><a href=\"https://github.com/codesake/codesake-dawn\">Github repo</a></li>"
        html_body += "</ul>"
        html_body += "<h3 class=\"muted\">Codesake::Dawn</h3>"
        html_body += "</div>"
        html_body += "<h1>Security code review results for \"#{File.basename(@engine.target)}\"</h1>"
        html_body += "<hr />"
        html_body += "<h2>Scan detail</h2>"
        html_body += "<div class=\"row\">"
        html_body += "<p>The scan was last executed #{@engine.scan_start.strftime("%d %b %Y - %T")} and Codesake::Dawn founds #{@engine.count_vulnerabilities} vulnerabilities</p>"
        html_body += "</div>"


        html_body += "<hr />"
        html_body += "<h2>Scan details</h2>"
        html_body += "<table class=\"table-striped table-bordered table\">"
        html_body += "<thead><tr><td>Key</td><td>Value</td></tr></thead>"
        html_body += "<tbody>"
        html_body += "<tr><td>Dawn version</td><td>#{Codesake::Dawn::VERSION}</td></tr>" unless Codesake::Dawn::RELEASE == "(development)"
        html_body += "<tr><td>Dawn development version</td><td>#{Codesake::Dawn::VERSION}</td></tr>" if Codesake::Dawn::RELEASE == "(development)"
        html_body += "<tr><td>Scan duration</td><td>#{@engine.scan_time.round(3)} sec</td></tr>" 
        html_body += "<tr><td>Target</td><td>#{@engine.target}</td></tr>" 
        html_body += "<tr><td>MVC detected framework</td><td>#{@engine.name} v#{@engine.get_mvc_version}</td></tr>" unless @engine.name == "Gemfile.lock"
        html_body += "<tr><td>MVC detected framework</td><td>#{@engine.force} v#{@engine.get_mvc_version}</td></tr>" if @engine.name == "Gemfile.lock"
        if @ret
          html_body += "<tr><td>Applied checks</td><td>#{@engine.applied_checks} security checks</td></tr>"
          html_body += "<tr><td>Skipped checks</td><td>#{@engine.skipped_checks} security checks</td></tr>"
        else
          html_body += "<tr><td>Applied checks</td><td>No security checks in the knowledge base</td></tr>"
        end

        html_body+="<tr><td>Vulnerabilities found</td><td>#{@engine.count_vulnerabilities}</td></tr>"
        html_body+="<tr><td>Mitigated issues found</td><td>#{@engine.mitigated_issues.count}</td></tr>"
        html_body+="<tr><td>Reflected XSS</td><td>#{@engine.reflected_xss.count}</td></tr>"
        html_body += "</tbody>"
        html_body += "</table>"

        

        if @engine.count_vulnerabilities > 0
          html_body += "<hr />"
          html_body += "<h2>Vulnerabilities found</h2> "
          html_body += "<table class=\"table-striped table-bordered table\">"
          html_body += "<thead><tr><td>Name</td><td>CVSS score</td><td>Description</td><td>Remediation</td></tr></thead>"

          @engine.vulnerabilities.each do |vuln|
            html_body += "<tr><td><a href=\"#{vuln[:cve_link]}\">#{vuln[:name]}</a></td><td>#{vuln[:cvss_score]}</td><td>#{vuln[:message]}</td><td>#{vuln[:remediation]}</td></tr>"
          end
          html_body += "</tbody>"
          html_body += "</table>"
        end
        html_body += "<div id=\"push\"></div>"
        html_body += "<div id=\"footer\">"
        html_body += "<div class=\"container\">"
        html_body += "<p class=\"muted credit\">&copy; <a href=\"http://dawn.codesake.com\">Codesake::Dawn</a> &mdash; #{Time.now.strftime("%Y")} &mdash; engine v#{Codesake::Dawn::VERSION} (#{Codesake::Dawn::RELEASE})</p>"
        html_body += "</div>"
        html_body +="</div>"
        html_body += "</div>"
        html_body += "</div>"

        html_body += "</body>"
        html_body += "</html>"


        html = html_head + html_body

        write(html)
        true
      end

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

        true
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

        write(result.to_json)
        true
      end

      def ascii_plain_report

        $logger.log "scanning #{@engine.target}"
        $logger.log "#{@engine.name} v#{@engine.get_mvc_version} detected" unless @engine.name == "Gemfile.lock"
        $logger.log "#{@engine.force} v#{@engine.get_mvc_version} detected" if @engine.name == "Gemfile.lock"
        $logger.log "applying all security checks" 
        if @ret
          $logger.log "#{@engine.applied_checks} security checks applied - #{@engine.skipped_checks} security checks skipped"
        else
          $logger.err "no security checks in the knowledge base"
        end

        if @engine.count_vulnerabilities != 0
          $logger.log "#{@engine.count_vulnerabilities} vulnerabilities found"
          @engine.vulnerabilities.each do |vuln|
            $logger.err "#{vuln[:name]} check failed"
            $logger.log "Description: #{vuln[:message]}" 
            $logger.log "Solution: #{vuln[:remediation]}"
            $logger.log "Evidence:"
            vuln[:evidences].each do |evidence|
              $logger.log "\t#{evidence}"
            end
          end
          if @engine.has_reflected_xss?
            $logger.log "#{@engine.reflected_xss.count} reflected XSS found"
            @engine.reflected_xss.each do |vuln|
              $logger.log "request parameter \"#{vuln[:sink_source]}\" is used without escaping in #{vuln[:sink_view]}. It was read here: #{vuln[:sink_file]}@#{vuln[:sink_line]}"
              $logger.err "evidence: #{vuln[:sink_evidence]}"
            end
          end

        else
          $logger.ok "no vulnerabilities found."
        end

        if @engine.mitigated_issues.count != 0
          $logger.log "#{@engine.mitigated_issues.count} mitigated vulnerabilities found"
          @engine.mitigated_issues.each do |vuln|
            $logger.ok "#{vuln[:name]} mitigated"
            vuln[:evidences].each do |evidence|
              $logger.err evidence
            end
          end
        end

        true
      end
    end
  end
end
