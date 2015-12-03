# Dawnscanner - roadmap

Dawnscanner is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks.

This is an ongoing roadmap for the Dawnscanner source code review tool.

The document is _dynamic_ and feature schedule may vary. If you do need a
feature to be included sooner, please open an [issue on
github](https://github.com/thesp0nge/dawnscanner/issues/new)

_latest update: Thu Dec  3 18:29:11 CET 2015_


## Version 1.5.5 (est. Jan 2016)

* close all issues on github markedsfor milestone 1.5.5
* Issue #131 - Adding a check for OSVDB 119927 : http Gem for Ruby SSL Certificate Validation MitM Spoofing
* Issue #119 - Adding a check for OSVDB 114641 : Ruby lib/rexml/entity.rb NULL String Handling Recursive XML External Entity (XXE) Expansion Resource Consumption Remote DoS
* Issue #118 - Adding a check for OSVDB 113965 : Sprockets Gem for Ruby Unspecified Request Handling File Enumeration
* Issue #117 - Adding a check for OSVDB 113986 : Ruby on Rails Action Pack Gem Unspecified Request Handling File Enumeration
* Issue #116 - Adding a check for OSVDB 113747 : Ruby lib/rexml/entity.rb XML External Entity (XXE) Expansion Remote DoS
* Issue #115 - Adding a check for OSVDB 112346 : Web Console Gem for Ruby on Rails Unspecified Issue
* Issue #114 - Adding a check for OSVDB 112347 : Ruby on Rails Active Job Global ID String Argument Deserialization Unspecified Object Injection
* Issue #113 - Adding a check for OSVDB 112683 : as Gem for Ruby Process List Local Plaintext Credentials Disclosure
* Issue #112 - Adding a check for OSVDB 115891 : Active Resource (ARes) Gem for Ruby lib/active_resource/base.rb Thread Object Instantiation Unspecified Issue
* Issue #111 - Adding a check for OSVDB 110796 : FlavourSaver Gem for Ruby Kernel::send Method Template Helper Calling Remote Code Execution
* Issue #110 - Adding a check for OSVDB 108971 : Ruby pack.c encodes() Function Remote Stack Buffer Overflow
* Issue #109 - Adding a check for OSVDB 110439 : Dragonfly Gem for Ruby Image Uploading & Processing Remote Command Execution
* Issue #108 - Adding a check for OSVDB 110147 : Active Record Gem for Ruby create_with Method Strong Parameter Protection Bypass
* Issue #107 - Adding a check for OSVDB 110004 : Bundler Gem for Ruby Multiple Top-level Source Lines Gemfile Handling Gem Installation Spoofing
* Issue #106 - Adding a check for OSVDB 108899 : brbackup Gem for Ruby /lib/brbackup.rb name Parameter SQL Injection
* Issue #105 - Adding a check for OSVDB 108901 : brbackup Gem for Ruby Process List Local Plaintext Password Disclosure
* Issue #104 - Adding a check for OSVDB 108900 : brbackup Gem for Ruby dbuser Variable Shell Metacharacter Injection Remote Command Execution
* Issue #103 - Ruby pack.c encodes() Function Remote Stack Buffer Overflow
* Issue #96 - Sinatra apps without views: NoMethodError
* adding test for CVE-2011-4969  XSS in jquery < 1.6.2


## Version 2.0.0 (est. June 2016)

### New supported frameworks

* Add Lotus support
* Add Maven support (this will lead of creating the skeleton of a
  dawnscanner-java gem. I will decide later if it will stay with the core or if
  it will be a separted gem plugging into dawnscanner as plugin).
* Add support for pure Rack applications
* Add basic support for Javascript. At the beginning, it will be a signature
  based support. dawnscanner will try to detect the js library version by using
  SHA hashing functions, comparing it with fingerprint of vulnerable libraies.
  Of course, this will lead to false negatives if a user tamper the original
  JS. We must consider also minified versions and we're not able to deal with
  obfuscated code.

### New checks

* Add a language check. It will handle a ruby script as input and a
  ruby\_parser line as unsafe pattern. It will compile the ruby and look for
  the unsafe pattern
* Cross Site Scripting, SQL injection and CSRF detection: it must be done for
  all MVC frameworks (including Rack) and it must cover either reflected than
  stored attack patterns
* Owasp RoR cheatsheet check for backup files **MUST** be integrated in
  dawnscanner the proper way. This is a dynamic tests that it must be run in a
  static way, looking for the public directory for old and backup files
  pattern.
* Security checks for vulnerabilities out until 31 May 2016.

### New features

* Separate dependencies check from model, view and controller analysis.
* Add a '--ab-decision' flag. Can be a good idea to make dawnscanner able just
  to say a quick "go/no go" for a release with a small json output like
  {decision:"GO", vulns: 12, mean\_cvss: 3.2} or {decision:"NO GO", vulns: 9,
  mean\_cvss:9.2}
* Add a --github option to Dawnscanner to clone a remote repository, perform
  a bundle install and do a code review.
* SQLite3 integration for saving data. Each project will have its own SQLite
  database containing reviews, findings and all. A table with Dawnscanner
  version it created the database will be inserted as well
* Add source code metrics gathering (lines of code, lines of comments,
  cyclomatic complexity index, ...)
* Add a ruby deprecation check, accordingly to
  https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering
* Add support for github hooks
* Add a new way to handle KB. Like wpscan, the KB must be separated and
  deployed using dawnscanner.org web site and a --update flag, people can use
  to upgrade and have new checks. Of course, new checks would be also rely on
  newer APIs, so a require dawnscanner info must be given and user forced also
  to upgrade the tool. KB download must be digitally signed and encrypted.
* Improving HTML output

### New Knowledge Base

* Issue #147 : In the KB revamp, a task to automate security issues search
  either in CVE archive than OSVDB or Ruby related mailing lists, it must be
  created.

### Issues

* Issue #148 - Adding a check for CVE-2011-4969:  XSS in jquery < 1.6.2

### Deprecates

* BasicCheck.priority

### Other

* clean rake kb:lint output
* clean rspec 'passing' tests

## Version 2.5.0 (est. December 2016)

* Add automatic mitigation patch generation for Ruby
* Add node.js support
* Add Opal support

## Long term Roadmap

This section is the long term part of dawnscanner roadmap. It anticipates
features they will come from version 3 or later.

* Some dynamic test
* Add WordPress themes/plugin support
* Add Ember support
* Add Joomla support
* Add Go support
* Add general PHP support
