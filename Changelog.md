# Codesake Dawn - changelog

Codesake::Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks.

_latest update: Mon Mar 31 09:05:57 CEST 2014_

## Version 1.1.1 - codename: Lightning McQueen (2014-0x-xx)

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
  Some other checks in the cheatsheet can't be turned into a Codesake::Dawn
  test, so all the cheatsheet content is covered since now.
* Added a --ascii-tabular-report (-a) to produce a report formatted with ascii
  tables. A bit of bin/dawn refactoring was necessary.
* Added a --json (-j) to produce JSON reports
* Added a --html (-h) to produce HTML reports
* Added a --file (-F) flag to save report to supplied filename
* Added Codesake::Dawn gem signature as described in
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
* New Codesake::Dawn::Kb::VersionCheck class to provide version specific
  checks, supporting beta version number, release candidate and pre. Fully
  integrated with DepedencyCheck and RubyVersionCheck
* Issue #34. I added a deprecation check. However I haven't found an official
  link saying which are MVC gem version to be considered officially deprecated
  or just old. I enabled only check against ruby
* Added a --seach-knowledge-base removing the optional parameter to
  --list-knowledge-base that is just for listing.
* Renamed '--list-knowledgebase' to '--list-knowledge-base' and '-k' short
  option was removed
* Added a --list-known-families option printing out Codesake::Dawn supported
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
* Added YAML Codesake::Dawn configuration support. Now you can specify your
  preferences in a .codesake-dawn.yaml file in your home directory (or you can
  use the --config-file option to specify the file you want to use). It returns
  an embedded default configuration if the supplied filename doesn't exist.
* Nokogiri DoS security checks discovered in December 2013, now have their own
  CVE: CVE-2013-6460 and CVE-2013-6461

## Version 1.0.6 - codename: Lightning McQueen (2014-03-23)

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
    + CVE-2014-1233: The paratrooper-pingdom gem 1.0.0 for Ruby allows local users to obtain the App-Key, username, and password values by listing the curl process.
    + CVE-2014-1234: The paratrooper-newrelic gem 1.0.1 for Ruby allows local users to obtain the X-Api-Key value by listing the curl process.
    + CVE-2014-0081: Multiple cross-site scripting (XSS) vulnerabilities in rails
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
  method. Now Codesake::Dawn uses a new codesake-commons gem version that fixes
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
