# Dawnscanner - roadmap

Dawnscanner is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks.

This is an ongoing roadmap for the Dawnscanner source code review tool.

The document is _dynamic_ and feature schedule may vary. If you do need a feature to be included sooner, please open an [issue on github](https://github.com/thesp0nge/dawnscanner/issues/new)

_latest update: Fri Nov 13 16:44:11 CET 2015_

## Version 1.5.0

* separate dependencies check from model, view and controller analysis.
* separate steps prints from results that must be saved on file.
* add a '--ab-decision' flag. Can be a good idea to make dawnscanner able just
  to say a quick "go/no go" for a release with a small json output like
  {decision:"GO", vulns: 12, mean\_cvss: 3.2} or {decision:"NO GO", vulns: 9,
  mean\_cvss:9.2}
* clear Codesake:Commons dependency mess. This will dramatically simplify
  dawnscanner installation
* Add a --github option to Dawnscanner to clone a remote repository, perform
  a bundle install and do a code review.
* create a task to check for new CVE in NVD website
* SQLite3 integration for saving data. Each project will have its own SQLite
  database containing reviews, findings and all. A table with Dawnscanner version it
  created the database will be inserted as well
* add a language check. It will handle a ruby script as input and a
  ruby\_parser line as unsafe pattern. It will compile the ruby and look for
  the unsafe pattern
* Issue #7: Improving HTML output and let the user the capability to provide a
  basic layout to customize report
* adding test for CVE-2011-4969  XSS in jquery < 1.6.2
* add source code metrics gathering (lines of code, lines of comments,
  cyclomatic complexity index, ...)

## Version 1.6.0

* Add a ruby deprecation check, accordingly to
  https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering
* Add preliminary Cross Site Scripting detection for Ruby on Rails.
* Add support for ERB for in detect\_views
* Add preliminary javascript support
* add support for pure Rack applications
* Cross Site Scripting detection: it must be done for all MVC frameworks
  (including Rack) and it must cover either reflected than stored attack
  patterns
* Add support for github hooks
* Add premilinary SQL injection detection for Ruby on Rails

## Version 1.7.0

* Add insecure direct object reference detection for all MVC frameworks (including Rack)
* SQL Injection detection: it must be done for all MVC frameworks (including Rack)
* Add automatic mitigation patch generation
* Add support for Javascript

## Version 1.8.0

* Add automatic mitigation patch generation

## Version 2.x.x and later

This section is the long term part of dawnscanner roadmap. It anticipates
features they deserve maybe a major release update.


* Add Lotus support
* Add WordPress themes/plugin support
* Add Opal support
* Add Ember support
* Add Joomla support
* Add node.js support
* Add Go support
* Add Maven support
* Add general PHP support
