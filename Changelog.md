# Dawnscanner - changelog

Dawnscanner is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks.

_latest update: Thu Jan 28 23:30:47 CET 2016_

## Version 1.5.3 - codename: Tow Mater (2016-xx-xx)

* Issue #186 - Adding a check for CVE-2015-7576: Timing attack vulnerability in
  basic authentication in Action Controller
* Issue #185 - Adding a check for CVE-2016-0751: Possible Object Leak and
  Denial of Service attack in Action Pack
* BUGFIX in is_vulnerable_minor? in case of version length mismatch, there was
  an error evaluating if safe_version.length > detected_version.length block
* BUGFIX in is_vulnerable_aux_patch? when detected version has no auxiliary
  patch (eg. 3.5.3) and safe version has it (eg. 3.5.3.1) the check was not
  triggered the right way. Now aux patch is forced to 0 when missing and when
  one of twos has it.
* Issue #184 - Adding a check for CVE-2015-7577: Nested attributes rejection
  proc bypass in Active Record.
* Issue #183 - Adding a check for CVE-2015-7579: XSS vulnerability in
  rails-html-sanitizer
* Issue #182 - Adding a check for CVE-2016-0752: Possible Information Leak
  Vulnerability in Action View
* Issue #181 - Adding a check for CVE-2016:0753: Possible Input Validation
  Circumvention in Active Model
* Issue #180 - Adding a check for CVE-2015-7578: Possible XSS vulnerability in
  rails-html-sanitizer
* Issue #179 - Adding a check for CVE-2015-7581: Object leak vulnerability for
  wildcard controller routes in Action Pack
* BUGFIX in is_higher? when a version with an aux patch number was compared
  with a one without ('1.2.3.4' vs '1.2.3') the incorrect result were
  triggered.
* BUGFIX in is_same_version? when a beta version is to be evaluated, during
  comparison the beta number must be discarded.
* BUGFIX in is_vulnerable_beta? handling situation when either safe version or
  detected version doesn't have the beta number
* BUGFIX in is_vulnerable_rc? handling situation when either safe version or
  detected version doesn't have the rc number
* BUGFIX in is_vulnerable_pre? handling situation when either safe version or
  detected version doesn't have the pre number
* Issue #173 handles a lot of CVE about nokogiri rubygem due to libxml version embedded on it:
  - CVE-2015-5312: DoS in xmlStringLenDecodeEntities()
  - CVE-2015-7497: DoS in xmlDictComputeFastQKey()
  - CVE-2015-7498: DoS in xmlParseXmlDecl()
  - CVE-2015-7499: In memory information disclosure due to heap-based buffer
    overflow in the xmlGROW()
  - CVE-2015-7500: DoS in xmlParseMisc()
  - CVE-2015-8241: Information disclosure and DoS in xmlNextChar()
  - CVE-2015-8242: Information disclosure and DoS in xmlSAX2TextNode()
  - CVE-2015-8317: Information disclosure in xmlParseXMLDecl()
* Issue #171 - Adding a check for CVE-2015-7541: colorscore Gem for Ruby
  lib/colorscore/histogram.rb Arbitrary Command Injection
* Issue #169 - Adding a check for CVE-2015-7519: Phusion Passenger Server
  allows to overwrite headers in some cases
* BUGFIX in bin/dawn when target from command line is '.'. The directory name
  must be expanded to save results
* Issue #177 BUGFIX. HTML reporting is broken. The line "support_path =
  File.join(Dir.pwd, 'support')" in reporter.rb:40 is used to build the path
  for support files (css, js) to be copied in the output directory. If you call
  dawn using '.' as target directory name, an exeception is raised. Fixed
  changing the line this way: "support_path = File.join(File.dirname(__FILE__),
  '..', '..', 'support')"
* Issue #177 BUGFIX. HTML filename creation is honored when -F flag is used.
* Issue #177 IMPROVEMENT. As @mort666 suggested, now bootstrap and jquery are
  loaded from CDN and specific CSS is now embedded in the HTML report in a
  minified form.


## Version 1.5.2 - codename: Tow Mater (2015-12-16)

* Back on issue #170. Engine.rb still requires code metrics stuff. Commented
  out.

## Version 1.5.1 - codename: Tow Mater (2015-12-09)

* Issue #170 - Error with code_metrics library cause Dawn to exit. Stats are
  not ready to be wired up yet. Commenting them out.

## Version 1.5.0 - codename: Tow Mater (2015-12-09)

* Issue #92 - Fix CVE-2014-3483 incorrectly triggers for a Rails 3 app.
* Issue #94 - dawn: Owasp Ror CheatSheet: Session management check failed
* Adding a check for CVE-2015-1819 : DoS in libxml embedded in nokogiri
  versions prior to 1.6.6.4
* Issue #129 - Adding a check for OSVDB 118954 : Ruby on Rails
  ActiveModel::Name to_json Call Infinite Loop Remote DoS
* VersionCheck - fixed an issue about minor versioning logic, mostly used for
  'rails' gem.
* Issue #130 - Adding a check for OSVDB 119878 : rest-client Gem for Ruby
  abstract_response.rb Redirection Response Set-Cookie Headers Handling Session
  Fixation
* Issue #123 - Adding a check for OSVDB 116010 : Doorkeeper Gem for Ruby
  access_token Disclosure CSRF
* Issue #124 - Adding a check for OSVDB 115654 : Sentry raven-ruby
  lib/raven/okjson.rb Exponent / Scientific Notation Value Handling Resource
  Consumption DoS
* Issue #126 - Adding a check for OSVDB 117903 : ruby-saml URI SAML Response
  Handling Remote Command Execution
* Issue #163 - Adding a check for OSVDB 122162 : RubyGems remote_fetcher.rb
  api_endpoint() Function Missing SRV Record Hostname Validation Request
  Hijacking
* Introduced a new core check Dawn::Kb::GemCheck for all checks related to
  RubyGems framework.
* Issue #164 - Adding a check for OSVDB 121701 : open-uri-cached Gem for Ruby
  Unsafe Temporary File Creation Local Privilege Escalation
* Issue #165 - Adding a check for OSVDB 120857 : refile Gem for Ruby
  remote_image_url Attachment Remote Command Execution
* Issue #166 - Adding a check for OSVDB 120415 : redcarpet Gem for Ruby
  markdown.c parse_inline() Function XSS
* Issue #161 - Mark as deprecated --rails, --padrino and --sinatra flags.  MVC
  detection will be automatic.
* Marked --gem-lock flag as deprecated. The dependencies check now is done
  using --dependencies flag
* Engine apply method it has been refactored to delete duplicated code
* Engine \_do\_apply method it has been marked as private with some touch of
  refactoring
* Issue #146 - Dependency check for installation troubles. Removed 'parser' and
  'ptools' gem from Gemfile and commented out 'grit' until version 2.0.0.
  Unfortunately I can't handle signed third party gems with an expired
  certificate.
* Ascii Table Reporting: now reports in ascii table are the default and now
  tables are written in separated text files under a
  dawnscanner/results/target/timestamp specific folder in $HOME directory.
  Issue #149.
* HTML Reporting: now reports are saved in their own folder (please, refere
  yourself to Ascii Table point for folder naming convention) with their own JS
  and CSS folder. This will lead customers to easy organize HTML output fitting
  their needs. Issue #149
* HTML Reporting: fixing up link and findings in report body. Issue #149
* Reports: removed 'priority' from all reports. Pretty useless, it can be
  removed in future release. Issue #149.
* Added '--console' to ask report in ascii text, no tables. Before this release
  this flag was useless since ascii text was the standard format. Issue #149.
* Deprecated '--ascii-tabular-report'. It takes ages for writing... better
  '--tabular'. Issue #149.
* -C, vulnerability count: now output is written to STDERR and fixed an issue
  causing output to be written always in JSON, even when not requested'
* Adding SQLite3 and Data Mapper dependencies
* Created a scan registry stored in $HOME/dawnscanner/db directory
* Added a '--list-scan-registry' flag to print all registry entries
* Changed config filename to dawnscanner.yaml
* Kb dump method moved from Dawn::Core to Dawn::KnowledgeBase
* Added a title for checks, useful for quick reporting




## Version 1.4.2 - codename: Tow Mater (2015-10-13)

* Applying pull request #140. Thanks to @j15e for fixing an issue with logger
  method causing dawn to abort. Thank you also to Igor to prompt me about this
  issue existing again.

## Version 1.4.1 - codename: Tow Mater (2015-10-13)

* Applying pull request #145. Thanks to @wmotti, a typo in CVE-2015-1840 has
  been fixed and the following false positives have been fixed as well:
  jquery-rails 3.1.4, rack 1.5.5, activesupport 4.1.13

## Version 1.4.0 - codename: Tow Mater (2015-09-16)

* Fixing issue #144. CVE-2013-4491 detected rails version 3.2.22 as vulnerable
  meanwhile it is not.
* Adding a check for CVE-2014-7818: Directory traversal in Action Pack
  contained in Ruby on Rails before 3.2.20, 4.0.11, 4.1.7 and 4.2.0.beta3
* Adding a check for CVE-2014-7819: Directory traversal in multiple sprocket
  versions.
* Adding a check for CVE-2014-4975: DoS in Ruby interpreter 1.9.x, 2.0.x, 2.1.x
* Adding a check for CVE-2014-3916: DoS in Ruby interpreter 1.9.x, 2.0.x, 2.1.x
* Adding a check for CVE-2014-7829: Directory traversal in several rails
  versions
* Adding a check for CVE-2014-8090: DoS in REXML parser in some ruby
  interpreter versions.
* Adding a check for CVE-2012-6674: XSS in RedCloth gem (issue #143)
* Adding a check for CVE-2014-9490: Denial of Service in raven-ruby gem (issue
  #124)
* Adding a check for CVE-2015-3448: Information leakage in rest-client gem
  (issue #125)

## Version 1.3.5 - codename: Lightning McQueen (2015-07-29)

* Adding a check for CVE-2015-293: XSS in the paperclip gem (issue #139)
* Adding a check for CVE-2015-1840: CSRF in jquery-rails and jquery-ujs gems.
  Please note that this is the first (and I hope the only) dependency check
  splitted in two parts. People from NVD assigned a single CVE to a
  vulnerability affecting two related but different gems. (issue #135)
* Adding a check for CVE-2015-3224: Whitelist bypass rack gem (issue #133)
* Adding a check for CVE-2015-3225: DoS in rack gem (issue #136)
* Adding a check for CVE-2015-3226: XSS in activesupport gem (issue #134)
* Adding a check for CVE-2015-3227: DoS in activesupport gem (issue #137)
* Adding a check for OSVDB-119927: MITM attack for http gem (issue #131)
* Adding a check for OSVDB-119878: Session Fixation for rest-client gem (issue
  #130)
* Adding a check for OSVDB-118954: Denial of service for rails gem (issue #129)
* Adding a check for OSVDB-118579: MySQL credentials disclosure due to a flaw
* Adding a check for OSVDB-118830: Sensitive information stored in production
  logs (issue #127)

## Version 1.3.1 - codename: Lightning McQueen (2015-02-19)

* Fixed last namespace pollution errors. Codesake namespace went away (issue
  #101)

## Version 1.3.0 - codename: Lightning McQueen (2015-02-18)

* Renewing digital signing certificate (issue #100)

## Version 1.2.99 - codename: Lightning McQueen (2015-01-07)

* Add a deprecation message. This is the last codesake-dawn release. New gem
  will be called dawnscanner.
* gem name changed from codesake-dawn to dawnscanner. Binary program remains
  'dawn' but the repository is moved here:
  https://github.com/thesp0nge/dawnscanner

## Version 1.2.0 - codename: Lightning McQueen (2014-07-14)

* Adding a check for OSVDB-108569: information disclosure in backup_checksum
  gem (issue #69)
* Fix issue #74. Now BasicChack has its own cve, osvdb attributes and a rake
  task will perform a sanity check if those values have been initialized
* Fix issue #62 about codesake-dawn config filename
* Adding a check for CVE-2013-2105: HTML injection in show_in_browser rubygem
* Fixing issue #68. I moved some file variable operation after the check for
  nil value. I can't reproduce on my station the offending bug :-(
* Adding a check for OSVDB-108570: arbitrary command execution for
  backup_checksum gem (issue #70)
* Adding a check for OSVDB-108530: remote code execution for kajam gem (issue
  #71)
* Adding a check for OSVDB-108563: remote code execution in gyazo rubygem
  (issue #72)
* Adding a check for CVE-2014-3482: SQL Injection on Rails 3.2.x due to
  PostgreSQL adapter for active record (issue #73)
* Adding a check for CVE-2014-3483: Ruby on Rails 4.x SQL Injection due to
  PostgreSQL adapter (issue #75)
* Fix issue #76 about codesake-dawn gem name being changed. On November 1st,
  2014 we will rename the codesake-dawn name to just 'dawn' cleaning up also
  the namespace.

## Version 1.1.3 - codename: Lightning McQueen (2014-05-06)

* Adding a check for CVE-2014-0130: directory traversal for ruby on rails

## Version 1.1.2 - codename: Lightning McQueen (2014-04-22)

* Adding a check for OSVDB-105971: remote code execution for sfpagent ruby gem

## Version 1.1.1 - codename: Lightning McQueen (2014-04-11)

* Fixing issue #52. The trailing '/' must be removed in File.exist? A begin -
  rescue block was added so to handle any exception. The default configuration
  is returned in case of error.
* Fixed issue #53. Both get_rbenv_ruby_ver and get_rvm_ruby_ver doesn't prepand
  @target when trying to fetch ruby version file content.
* Fix issue #54. There were some unconsistence in command line call when
  forcing the MVC instead of autodetect it. I refactored the part and it was
  back to work now.
* Fixed issue #55. Introducing yaml config file, gemfile_name default value is
  empty string not nil anymore. Therefore bin/dawn must check for emptyness not
  for nil value.
* Issue #57: @zoltrain made a pull request to add vulnerability properties to
  json output in reporter class.
* Issue #38. During the discussion, @shaneog pointed out that
  --disable-ror-cheatsheet flag worked but disabling the whole family from the
  YAML config file didn't. Due to a silly typo the magic didn't happened. Fixed
  now.

## Version 1.1.0 - codename: Lightning McQueen (2014-04-04)

* Added a check for CVE-2011-5036
* Added a check for CVE-2012-6109
* Added a check for CVE-2013-0183
* Added a check for CVE-2013-0184
* Added a check for CVE-2013-0262
* Added a check for CVE-2013-1607
* Added a check for CVE-2013-2512
* Added a check for CVE-2013-2513
* Added a check for CVE-2013-2516
* Added a check for CVE-2013-4203
* Added a check for CVE-2013-4413
* Added a check for CVE-2013-4489
* Added a check for CVE-2013-4593
* Added a check for CVE-2013-5671
* Added a check for CVE-2014-0080
* Added a check for CVE-2014-2525
* Added remaining compliance checks against Owasp Ruby on Rails cheatsheet.
  Some other checks in the cheatsheet can't be turned into a Dawn
  test, so all the cheatsheet content is covered since now.
* Added a --ascii-tabular-report (-a) to produce a report formatted with ascii
  tables. A bit of bin/dawn refactoring was necessary.
* Added a --json (-j) to produce JSON reports
* Added a --html (-h) to produce HTML reports
* Added a --file (-F) flag to save report to supplied filename
* Added Dawn gem signature as described in
  http://guides.rubygems.org/security/. README is modified accordingly with new
  installation suggestions. Added also gem SHA512 checksum in repository.
* Added a not_affected attribute to dependency check to flag as not vulnerable
  previous versions
* CVE-2013-2090: we were uncertain about previous cremefraiche version if they
  were vulnerable or not. Gem author, yanked all previous version but the
  latest released 29 January 2014. We removed the rspec check for version <
  0.6.x
* basic_check.rb: due to the great @rubysec guys work, the link to their site
  is provided as well. True to be told, there are some CVE valid but not found
  on NVID website, so having @rubysec link is even more accurate in those
  situations.
* New Dawn::Kb::VersionCheck class to provide version specific
  checks, supporting beta version number, release candidate and pre. Fully
  integrated with DepedencyCheck and RubyVersionCheck
* Issue #34. I added a deprecation check. However I haven't found an official
  link saying which are MVC gem version to be considered officially deprecated
  or just old. I enabled only check against ruby
* Added a --seach-knowledge-base removing the optional parameter to
  --list-knowledge-base that is just for listing.
* Renamed '--list-knowledgebase' to '--list-knowledge-base' and '-k' short
  option was removed
* Added a --list-known-families option printing out Dawn supported
  check family name
* Removed '-f' short option for list-known-framework
* Added family and severity to Owasp RoR Cheatsheet files
* Add a method to return severity level. If it's provided by check constructor
  then that value is used, otherwise is calculated using CVSS.  If no value and
  no CVSS are available the return value is "unknown".
* Removed old ruby version check from BasicCheck. It's outdated and no longer
  needed
* Added --disable-cve-bulletins flag to disable all CVE security checks
* Added --disable-code-quality flag to disable all code quality checks
* Added --disable-code-style flag to disable all code style checks
* Added --disable-owasp-ror-cheatsheet flag to disable all Owasp Ruby on Rails
  cheatsheet checks
* Added --disable-owasp-top-10 flag to disable all Owasp Top 10 checks
* Revamped help output
* Added YAML Dawn configuration support. Now you can specify your
  preferences in a .codesake-dawn.yaml file in your home directory (or you can
  use the --config-file option to specify the file you want to use). It returns
  an embedded default configuration if the supplied filename doesn't exist.
* Nokogiri DoS security checks discovered in December 2013, now have their own
  CVE: CVE-2013-6460 and CVE-2013-6461

## Version 1.0.6 - codename: Lightning McQueen (2014-03-23)

* Added a check for CVE-2014-2538

## Version 1.0.5 - codename: Lightning McQueen (2014-03-18)

* Added a check for CVE-2014-2322
* Added a check for CVE-2014-0036

## Version 1.0.4 - codename: Lightning McQueen (2014-03-14)

* Backporting of some CVEs introduced in 2014 from the development branch.
  Since it will take some time to improve dawn 1.1 and since I forgot to merge
  some useful CVE released since January also in master, I do it know. Please
  note that, due to a big change in DependencyCheck class the check against
  CVE-2014-0080 will be only available with dawn 1.1.

  Backported checks are:
    + CVE-2014-1233: The paratrooper-pingdom gem 1.0.0 for Ruby allows local
      users to obtain the App-Key, username, and password values by listing the
      curl process.
    + CVE-2014-1234: The paratrooper-newrelic gem 1.0.1 for Ruby allows local
      users to obtain the X-Api-Key value by listing the curl process.
    + CVE-2014-0081: Multiple cross-site scripting (XSS) vulnerabilities in
      rails
    + CVE-2014-0082: Denial of service in Rails before 3.2.17

  New security checks are for Owasp ROR Cheatsheet:
    + Check for safe redirect and forward
    + Check for sensitive file

## Version 1.0.3 - codename: Lightning McQueen (2014-02-13)

* Fixing issue #37. Now the rake task is successfully loaded when you require
  the 'codesake/dawn/tasks' path. The task is dawn:run.

## Version 1.0.2 - codename: Lightning McQueen (2014-01-27)

* Fixing issue #27. With rainbow gem version 2.0.0 there is an exception while
  codesake-commons logging facilities tries to print something with the .color
  method. Now Dawn uses a new codesake-commons gem version that fixes
  how rainbow gem deals with colorized output.

## Version 1.0.1 - codename: Lightning McQueen (2014-01-25)

* Fixing issue #22. PatternMatchingCheck evaluates lines starting with the '#'
  when applying regular expresion to get the job done. Of course this can be an
  issue when it finds offending patterns inside comments (and this is why using
  pattern matching in a security code review is EVIL!). Now there is an
  attribute, avoid\_comments that tells the class to eventually strip leading
  whitespaces from string and not to apply regex if the line is starting with
  '#'.
  Again, applying pattern matching approach to security leads to a lot of false
  positives and should be avoided when possible, even with low severity checks
  like this.
* Fixing issue #21. RoR cheatsheet security checks now have a detailed message
  telling what's wen wrong with the code and why the check fired.

## Version 1.0.0 - codename: Lightning McQueen (2014-01-21)

* Fixing issue #19 (https://github.com/codesake/codesake-dawn/issues/19). There
  was a problem on ```is_a_vulnerable_version?``` routine that flags a security
  check as vulnerable even if it wasn't. During the dependency check, if the
  vulnerable gem and the dependency has both major and minor version equal and
  the patch number tells if the gem is vulnerable or not, this check failed.
* ruby_version_check.rb: fixed an issue on is_vulnerable_patchlevel? that
  caused a nil pointer exception when ruby interpreter patchlevel was evaluated
* ruby_version_check.rb: fixed an issue on is_vulnerable_patchlevel? that loads
  the safe patchlevels comparing the wrong parameter.
* Added a rake task to better integrate codesake-dawn in a continous
  development workflow. Now when you install codesake-dawn you have a 'rake
  dawn' task executing the tool on the current directory.
* In BasicCheck::is_vulnerable_version? added support for the fourth version
  number. We needed this to implement check for CVE-2013-7086
* Fixing issue #20. is_vulnerable_version? has a problem when the patchlevel is
  the same but there are only three different version numbers (x.y.z format).
  The last change introduces this vuln. Thank you Florin for opening the issue.
* Created a dedicated web site: [dawn.codesake.com](http://dawn.codesake.com)
* Fixing issue #8. The omniauth-oauth2 version 1.1.1 has a CSRF vulnerability
  (CVE-2012-6134). The patch is already merged in the git repository but there
  are no further gem releases. The suggested mitigation is to tell your Gemfile
  to fetch the code directly from github rather then using rubygems.org
* Fixing issue #18. Owasp RoR Cheatsheet check was missing of message and
  mitigation step.
* Fixing issue #17 with some more directories to be in whitelist in pattern
  matching check. More exclusions will be added in further releases
* Added spec files for almost all security checks after 2008. Almost all kind
  of checks (dependency, pattern matching, combo, ruby version) are covered by
  a test.
* DependencyCheck assumes that if x.y.z version fixes an issue, every minor
  version in the same major are affected as well. This assumption is risky, so
  we introduced an attribute saying that the previous minor versions are
  affected or not. This attribute is automagically set to true in dependencies
  check when dealing with the rails gem.  This assumption is not done for
  previous major versions. Let's say a gem version 1.2.3 has a problem,
  DependencyCheck doesn't say nothing about 0.9.3, but it thinks 1.1.9 is
  vulnerable.
* Added a check for CVE-2004-0755
* Added a check for CVE-2004-0983
* Added a check for CVE-2005-1992
* Added a check for CVE-2005-2337
* Added a check for CVE-2006-1931
* Added a check for CVE-2006-2582
* Added a check for CVE-2006-3694
* Added a check for CVE-2006-4112
* Added a check for CVE-2006-5467
* Added a check for CVE-2006-6303
* Added a check for CVE-2006-6852
* Added a check for CVE-2006-6979
* Added a check for CVE-2007-0469
* Added a check for CVE-2007-5162
* Added a check for CVE-2007-5379
* Added a check for CVE-2007-5380
* Added a check for CVE-2007-5770
* Added a check for CVE-2007-6077
* Added a check for CVE-2007-6612
* Added a check for CVE-2008-1145
* Added a check for CVE-2008-1891
* Added a check for CVE-2008-2376
* Added a check for CVE-2008-2662
* Added a check for CVE-2008-2663
* Added a check for CVE-2008-2664
* Added a check for CVE-2008-2725
* Added a check for CVE-2008-3655
* Added a check for CVE-2008-3657
* Added a check for CVE-2008-3790
* Added a check for CVE-2008-3905
* Added a check for CVE-2008-4094
* Added a check for CVE-2008-4310
* Added a check for CVE-2008-5189
* Added a check for CVE-2008-7248
* Added a check for CVE-2009-4078
* Added a check for CVE-2009-4124
* Added a check for CVE-2009-4214
* Added a check for CVE-2010-2489
* Added a check for CVE-2010-3933
* Added a check for CVE-2011-0188
* Added a check for CVE-2011-0739
* Added a check for CVE-2011-1004
* Added a check for CVE-2011-1005
* Added a check for CVE-2011-2686
* Added a check for CVE-2011-2705
* Added a check for CVE-2011-2930
* Added a check for CVE-2011-3009
* Added a check for CVE-2011-3187
* Added a check for CVE-2011-4319
* Added a check for CVE-2012-1098
* Added a check for CVE-2012-2139
* Added a check for CVE-2012-2671
* Added a check for CVE-2013-0162
* Added a check for CVE-2013-0256
* Added a check for CVE-2013-0263
* Added a check for CVE-2013-1756
* Added a check for CVE-2013-2090
* Added a check for CVE-2013-2119
* Added a check for CVE-2013-5647
* Added a check for CVE-2013-6459
* Added a check for CVE-2013-7086


## Version 0.85 - codename: elevator (2013-12-17)

* refactoring bin/dawn script: some stuff were moved into Codesake::Core class
* Added a check against Denial of Service vulnerability for Nokogiri 1.5.x
  and 1.6.0 when used with JRuby.
* Added a check against Denial of Service vulnerability due to entity expansion
  for Nokogiri 1.5.x and 1.6.0 when used with JRuby.
* Added a check for CVE-2013-4478 (sup remote code execution)
* Added a check for CVE-2013-4479 (sup remote code execution)
* Added a check for CVE-2013-1812 (ruby-openid denial of service)
* Added a check for CVE-2013-6421 (sprout remote code execution)


## Version 0.80 - codename: elevator (2013-12-12)

* adding test for CVE-2013-4164
* adding test for CVE-2013-4457
* adding test for CVE-2013-4562
* added a '-z' flag to exit the process with the number of issues found as exit code
* added a Cross Site Scripting in Simple Form gem
* adding test for CVE-2013-4492
* adding test for CVE-2013-4491
* adding test for CVE-2013-6414
* adding test for CVE-2013-6415
* adding test for CVE-2013-6416
* adding test for CVE-2013-6417


## Version 0.79.99 - codename:oddity (2013-11-14)

This is the first codesake-dawn version making codesake.com web application
able to scan something. It deserves a special release.

* adding test for CVE-2013-2065
* adding test for CVE-2013-4389
* adding test for CVE-2010-1330
* adding test for CVE-2011-0446
* adding test for CVE-2011-0995
* adding test for CVE-2011-2929
* adding test for CVE-2011-4815
* adding test for CVE-2012-3424
* adding test for CVE-2012-5380
* adding test for CVE-2012-4522
* adding test for RoRCheatSheet\_1
* adding test for RoRCheatSheet\_4
* adding test for RoRCheatSheet\_7
* adding test for RoRCheatSheet\_8
* Fix issue #1. You can read more about it in TODO.md
* Added API to scan a single Gemfile.lock using -G flag


## Version 0.70 (2013-06-19)

* adding test for CVE-2011-0447
* adding test for CVE-2011-3186
* adding test for CVE-2012-1099
* adding test for CVE-2012-1241
* adding test for CVE-2012-2140
* adding test for CVE-2012-5370
* adding test for CVE-2012-5371
* adding test for CVE-2011-2197
* adding test for CVE-2011-2932
* adding test for CVE-2012-3463
* adding test for CVE-2012-3464
* adding test for CVE-2012-4464
* adding test for CVE-2012-4466
* adding test for CVE-2012-4481
* adding test for CVE-2012-6134
* Fix issue #4. PatternMatching complains when applied to binary files. We must
  skip them
* add ruby\_parser dependency
* add haml dependency
* add target MVC autodetect
* write '--help'
* detect sinks for XSS in Sinatra applications
* detect reflected XSS in Sinatra applications


## Version 0.60 (2013-05-28)

* adding cucumber dependency
* adding test for CVE-2013-1854
* adding test for CVE-2013-1856
* adding test for CVE-2013-0276
* adding test for CVE-2013-0277
* adding test for CVE-2013-0156
* adding test for CVE-2013-2615
* adding test for CVE-2013-1875
* adding test for CVE-2013-1655
* adding test for CVE-2013-1656
* adding test for CVE-2013-0175
* adding test for CVE-2013-0233
* adding test for CVE-2013-0284
* adding test for CVE-2013-0285
* adding test for CVE-2013-1801
* adding test for CVE-2013-1802
* adding test for CVE-2013-1821
* adding test for CVE-2013-1898
* adding test for CVE-2013-1911
* adding test for CVE-2013-1933
* adding test for CVE-2013-1947
* adding test for CVE-2013-1948
* adding test for CVE-2013-2616
* adding test for CVE-2013-2617
* adding test for CVE-2013-3221
* make output less verbose. Only vulnerabilities and severity will be shown
* adding a '--verbose' option to see also the whole knowledge base info about each findings
* adding a '--output' option
* adding a '--count-only' option
* support JSON output


## Version 0.50 (2013-05-13) - First public release

* adding test for CVE\_2013\_0269
* adding test for CVE\_2013\_0155
* adding test for CVE\_2011\_2931
* adding test for CVE\_2012\_3465
