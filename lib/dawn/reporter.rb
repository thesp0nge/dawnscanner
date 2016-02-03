module Dawn
  class Reporter

    def initialize(options={})
      @engine = nil
      @ret = false

      @filename = options[:filename]
      @ret = options[:apply_all_code] unless options[:apply_all_code].nil?
      @format = options[:format] unless options[:format].nil?
      @engine = options[:engine] unless options[:engine].nil?

      @format = :tabular unless is_valid_format?(@format)
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
        # $logger.warn "I will use codesake.css, bootstrap.min.css and bootstrap.js stored in ./support/ directory" if @format == :html
        File.open(@filename, "w") do |f|
          f.puts output
        end
        $logger.info "#{@filename} created (#{output.length} bytes)"
      end
    end

    def write_html(path, content)
      css_path = File.join(path, 'css')
      js_path = File.join(path, 'js')
      support_path = File.join(File.dirname(__FILE__), '..', '..', 'support')

      FileUtils.mkdir_p(File.join(path, 'css'))
      FileUtils.mkdir_p(File.join(path, 'js'))

      FileUtils.cp(File.join(support_path, 'bootstrap.js'), js_path)
      FileUtils.cp(File.join(support_path, 'bootstrap.min.css'), css_path)
      FileUtils.cp(File.join(support_path, 'codesake.css'), css_path)

      File.open(File.join(path, 'report.html'), "w") do |f|
        f.puts content
      end
      $logger.info "#{File.join(path, 'report.html')} created (#{File.stat(File.join(path, 'report.html')).size} bytes)"

    end

    def write_table(path, content)
      File.open(path, "w") do |f|
        f.puts content
      end
      $logger.info "#{path} created (#{File.stat(path).size} bytes)"
    end

    def is_valid_format?(format)
      return false if format.nil?
      return true if (format == :console) || (format == :tabular) || (format == :json) || (format == :html) || (format == :csv)
      return false # otherwise
    end

    def html_report
      output = @engine.create_output_dir if @filename.nil?
      html_head = "<!doctype html>\n<html>\n<head>\n<title>Dawnscanner report for #{File.basename(@engine.target)}</title>"
      html_head +=" <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" integrity=\"sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7\" crossorigin=\"anonymous\">"

      html_head += "<script src=\"https://code.jquery.com/jquery-2.2.0.min.js\"></script>"
      html_head += "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css\" integrity=\"sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r\" crossorigin=\"anonymous\">"

      html_head += "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\" integrity=\"sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS\" crossorigin=\"anonymous\"></script>"
      html_head += "<style type=\"text/css\">body{padding-top:20px;padding-bottom:40px}.container-narrow{margin:0 auto;max-width:700px}.container-narrow>hr{margin:30px 0}.jumbotron,.marketing{margin:60px 0}.jumbotron{text-align:center}.jumbotron h1{font-size:72px;line-height:1}.jumbotron .btn{font-size:21px;padding:14px 24px}.marketing p+h4{margin-top:28px}#wrap{min-height:100%;height:auto!important;height:100%;margin:0 auto -60px}#footer,#push{height:60px}#footer{background-color:#f5f5f5}@media (max-width:767px){#footer{margin-left:-20px;margin-right:-20px;padding-left:20px;padding-right:20px}}
</style>"
      html_head += "</head>\n"

      html_body =  "<body>\n"
      html_body +=  ""
      html_body += "<div id=\"wrap\">\n"
      html_body += "<div class=\"container-narrow\">\n"
      html_body += "<div class=\"masthead\">\n"
      html_body += "<ul class=\"nav nav-pills pull-right\">\n"
      html_body += "<li class=\"\"><a href=\"http://dawnscanner.org\">Home</a></li>\n"
      html_body += "<li class=\"active\"><a href=\"https://github.com/thesp0nge/dawnscanner\">Github repo</a></li>\n"
      html_body += "</ul>\n"
      html_body += "<h3 class=\"muted\">Dawnscanner</h3>\n"
      html_body += "</div>\n"
      html_body += "<h1>Security code review results for \"#{File.basename(@engine.target)}\"</h1>\n"
      html_body += "<hr />\n"
      html_body += "<h2>Scan detail</h2>\n"
      html_body += "<div class=\"row\">\n"
      html_body += "<p>The scan was last executed #{@engine.scan_start.strftime("%d %b %Y - %T")} and Dawn founds #{@engine.count_vulnerabilities} vulnerabilities</p>\n"
      html_body += "</div>\n"
      html_body += "<hr />\n"
      html_body += "<h2>Scan details</h2>\n"
      html_body += "<table class=\"table-striped table-bordered table\">\n"
      html_body += "<thead><tr><td>Key</td><td>Value</td></tr></thead>\n"
      html_body += "<tbody>\n"
      html_body += "<tr><td>Dawn version</td><td>#{Dawn::VERSION}</td></tr>" unless Dawn::RELEASE == "(development)\n"
      html_body += "<tr><td>Dawn development version</td><td>#{Dawn::VERSION}</td></tr>" if Dawn::RELEASE == "(development)\n"
      html_body += "<tr><td>Scan duration</td><td>#{@engine.scan_time.round(3)} sec</td></tr>\n"
      html_body += "<tr><td>Target</td><td>#{@engine.target}</td></tr>\n"
      html_body += "<tr><td>MVC detected framework</td><td>#{@engine.name} v#{@engine.get_mvc_version}</td></tr>" unless @engine.name == "Gemfile.lock\n"
      html_body += "<tr><td>MVC detected framework</td><td>#{@engine.force} v#{@engine.get_mvc_version}</td></tr>" if @engine.name == "Gemfile.lock\n"
      if @ret
        html_body += "<tr><td>Applied checks</td><td>#{@engine.applied_checks} security checks</td></tr>\n"
        html_body += "<tr><td>Skipped checks</td><td>#{@engine.skipped_checks} security checks</td></tr>\n"
      else
        html_body += "<tr><td>Applied checks</td><td>No security checks in the knowledge base</td></tr>\n"
      end

      html_body+="<tr><td>Vulnerabilities found</td><td>#{@engine.count_vulnerabilities}</td></tr>\n"
      html_body+="<tr><td>Mitigated issues found</td><td>#{@engine.mitigated_issues.count}</td></tr>\n"
      html_body+="<tr><td>Reflected XSS</td><td>#{@engine.reflected_xss.count}</td></tr>\n"
      html_body += "</tbody>\n"
      html_body += "</table>\n"


      if @engine.count_vulnerabilities > 0
        html_body += "<hr />\n"
        html_body += "<h2>Vulnerabilities found</h2>\n"
        html_body += "<table class=\"table-striped table-bordered table\">\n"
        html_body += "<thead><tr><td>Name</td><td>Severity</td><td>CVSS score</td><td>Description</td><td>Remediation</td></tr></thead>\n"

        html_body += "<tbody>"
        @engine.vulnerabilities.each do |vuln|
          html_body += "<tr><td><a href=\"#{vuln[:cve_link]}\">#{vuln[:name]}</a></td><td>#{vuln[:severity]}</td><td>#{vuln[:cvss_score]}</td><td>#{vuln[:message]}</td><td>#{vuln[:remediation]}</td></tr>\n"
        end
        html_body += "</tbody>\n"
        html_body += "</table>\n"
      end
      html_body += "<div id=\"push\"></div>\n"
      html_body += "<div id=\"footer\">\n"
      html_body += "<div class=\"container\">\n"
      html_body += "<p class=\"muted credit\">Proudly generated with <a href=\"http://dawnscanner.org\">Dawnscanner</a> &mdash; #{Time.now.strftime("%Y")} &mdash; engine v#{Dawn::VERSION} (#{Dawn::RELEASE})</p>\n"
      html_body += "</div>\n"
      html_body += "</div>\n"
      html_body += "</div>\n"
      html_body += "</div>\n"

      html_body += "</body>\n"
      html_body += "</html>"


      html = html_head + html_body

      unless @filename.nil?
        write(html)
      else
        write_html(output,  html)
      end
      true
    end

    def ascii_tabular_report

      output = @engine.create_output_dir

      # 0_First table: executive summary
      rows = []
      rows << ['Dawn version', Dawn::VERSION] unless Dawn::RELEASE == "(development)"
      rows << ['Dawn development version', Dawn::VERSION] if Dawn::RELEASE == "(development)"
      rows << ['Scan started', @engine.scan_start]
      rows << ['Scan duration', "#{@engine.scan_time.round(3)} sec"]
      rows << ['Target', @engine.target]
      rows << ['Framework', "#{@engine.name} v#{@engine.get_mvc_version}" ] unless @engine.name == "Gemfile.lock"
      rows << ['Framework', "#{@engine.force} v#{@engine.get_mvc_version}" ] if @engine.name == "Gemfile.lock"
      if @ret
        rows << ['Applied checks', "#{@engine.applied_checks} security checks"]
        rows << ['Skipped checks', "#{@engine.skipped_checks} security checks"]
      else
        rows << ['Applied checks', "No security checks in the knowledge base"]
      end
      rows << ['Vulnerabilities found in dependencies', @engine.count_vulnerabilities]
      rows << ['Vulnerabilities mitigated by external factors', @engine.mitigated_issues.count] unless @engine.mitigated_issues.count == 0
      rows << ['Reflected XSS found', @engine.reflected_xss.count]
      table = Terminal::Table.new :title=>'Scan summary', :rows => rows
      write_table(File.join(output, 'summary.txt'), table)

      # 0_a) Application structure
      rows = []
      rows << ['Lines of code', 'to be added soon']
      rows << ['Cyclomatic complexity index', 'to be added soon']
      rows << ['Models', @engine.models.count]
      rows << ['Views', @engine.views.count]
      rows << ['Controllers', @engine.controllers.count]
      table = Terminal::Table.new :title=>'Application stats', :rows => rows
      write_table(File.join(output, 'statistics.txt'), table)

      if @engine.count_vulnerabilities > 0

        # 1) Vulnerabilities

        # 1_a) Third party gem vulnerabilities
        rows = []
        @engine.vulnerabilities.each do |vuln|
          rows << [vuln[:name].justify(10), vuln[:severity], vuln[:message].justify(30), vuln[:remediation].justify(15), vuln[:evidences].join.justify(15)]
          rows << :separator
        end
        table = Terminal::Table.new :title=>"Vulnerabilities", :headings=>['Issue', 'Severity', 'Description', 'Solution', 'Evidences'], :rows=>rows
        write_table(File.join(output, 'third_party_vulnerabilities.txt'), table)

        # 1_b) Refleted XXS
        rows = []
        if @engine.has_reflected_xss?
          @engine.reflected_xss.each do |vuln|
            rows << [vuln[:sink_source], vuln[:sink_view], "#{vuln[:sink_file]}@#{vuln[:sink_line]}",vuln[:sink_evidence]]
            rows << :separator
          end
          table = Terminal::Table.new :title=>"Reflected Cross Site Scripting", :headings=>['Sink name', 'View', 'Location the sink was read', 'Evidences'], :rows=>rows
          write_table(File.join(output, 'reflected_xss.txt'), table)
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
        write_table(File.join(output, 'mitigated_issues.txt'), table)
      end

      true
    end


    def json_report
      result = {}
      return {:status=>"KO", :message=>"BUG at #{__FILE__}@#{__LINE__}: target is empty or engine is nil."}.to_json if @engine.target.empty? or @engine.nil?
      return {:status=>"KO", :message=>"#{target} doesn't exist"}.to_json if ! Dir.exist?(@engine.target)
      return {:status=>"KO", :message=>"no security checks applied"}.to_json unless @ret

      result[:status]="OK"
      result[:dawn_version] = Dawn::VERSION
      result[:dawn_status] = "Develoment version" if Dawn::RELEASE == "(development)"
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
        result[:vulnerabilities] << {
          :name => v[:name],
          :cve_link => v[:cve_link],
          :severity => v[:severity],
          :cvss_score => v[:cvss_score],
          :message => v[:message],
          :remediation => v[:remediation]
        }
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

      result = sprintf "%s\n", "scanning #{@engine.target}"
      result += sprintf "%s\n", "#{@engine.name} v#{@engine.get_mvc_version} detected" unless @engine.name == "Gemfile.lock"
      result += sprintf "%s\n", "#{@engine.force} v#{@engine.get_mvc_version} detected" if @engine.name == "Gemfile.lock"
      result += sprintf "%s\n", "applying all security checks"
      if @ret
        result += sprintf "%s\n", "#{@engine.applied_checks} security checks applied - #{@engine.skipped_checks} security checks skipped"
      else
        result += sprintf "%s\n", "no security checks in the knowledge base"
      end

      if @engine.count_vulnerabilities != 0
        result += sprintf "%s\n", "#{@engine.count_vulnerabilities} vulnerabilities found"
        @engine.vulnerabilities.each do |vuln|
          result += sprintf "%s\n", "#{vuln[:name]} check failed\n"
          result += sprintf "%s\n", "#{vuln[:message].justify(70)}"
          result += sprintf "%s\n", "Evidence:"
          vuln[:evidences].each do |evidence|
            result += sprintf "%s\n", "\t#{evidence}"
          end
          result += sprintf "\n\n"
        end
        if @engine.has_reflected_xss?
          result += sprintf "%s\n", "#{@engine.reflected_xss.count} reflected XSS found"
          @engine.reflected_xss.each do |vuln|
            result += sprintf "%s\n", "request parameter \"#{vuln[:sink_source]}\" is used without escaping in #{vuln[:sink_view]}. It was read here: #{vuln[:sink_file]}@#{vuln[:sink_line]}"
            result += sprintf "%s\n", "evidence: #{vuln[:sink_evidence]}"
          end
        end

      else
        result += sprintf "%s\n", "no vulnerabilities found."
      end

      if @engine.mitigated_issues.count != 0
        result += sprintf "%s\n", "#{@engine.mitigated_issues.count} mitigated vulnerabilities found"
        @engine.mitigated_issues.each do |vuln|
          result += sprintf "%s\n", "#{vuln[:name]} mitigated"
          vuln[:evidences].each do |evidence|
            result += sprintf "%s\n", evidence
          end
        end
      end

      write(result)
      true
    end
  end
end
