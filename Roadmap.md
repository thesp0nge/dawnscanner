# Dawnscanner - roadmap

Dawnscanner is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks.

This is an ongoing roadmap for the Dawnscanner source code review tool.

The document is _dynamic_ and feature schedule may vary. If you do need a
feature to be included sooner, please open an [issue on
github](https://github.com/thesp0nge/dawnscanner/issues/new)

_latest update: Wed Nov 18 08:29:46 CET 2015_

## Version 1.5.0

* clear Codesake:Commons dependency mess. This will dramatically simplify
  dawnscanner installation
* create a task to check for new CVE in NVD website
* adding test for CVE-2011-4969  XSS in jquery < 1.6.2
* close all issues on github marked for milestone 1.5.0
* improve STDOUT prints: it must says the current stage and all findings or
  warnings must be on STDERR instead.

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

## Version 2.5.0 (est. December 2016)

* Improving HTML output and let the user the capability to provide a basic
  layout to customize report
* Add automatic mitigation patch generation for Ruby
* Add node.js support
* Add Opal support

## Long term Roadmap

This section is the long term part of dawnscanner roadmap. It anticipates
features they will come from version 3 or later.

* Add WordPress themes/plugin support
* Add Ember support
* Add Joomla support
* Add Go support
* Add general PHP support
