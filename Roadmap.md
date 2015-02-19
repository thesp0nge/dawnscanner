# Codesake Dawn - roadmap

Dawnscanner is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks.

This is an ongoing roadmap for the Dawnscanner source code review tool.

_latest update: Mon Mar 31 13:01:21 CEST 2014_

## Version 1.2.0

* create a task to check for new CVE in NVD website
* SQLite3 integration for saving data. Each project will have its own SQLite
  database containing reviews, findings and all. A table with Dawnscanner version it
  created the database will be inserted as well
* add a language check. It will handle a ruby script as input and a
  ruby\_parser line as unsafe pattern. It will compile the ruby and look for
  the unsafe pattern
* Add preliminary Cross Site Scripting detection for Ruby on Rails.
* Issue #7: Improving HTML output and let the user the capability to provide a
  basic layout to customize report
* Add a ruby deprecation check, accordingly to
  https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering

## Version 1.3.0

* Add support for ERB for in detect\_views
* Add preliminary javascript support
* adding test for CVE-2011-4969  XSS in jquery < 1.6.2
* add support for pure Rack applications
* Cross Site Scripting detection: it must be done for all MVC frameworks
  (including Rack) and it must cover either reflected than stored attack
  patterns
* Add a --github option to Dawnscanner to clone a remote repository, perform
  a bundle install and do a code review.
* Add support for github hooks
* Add premilinary SQL injection detection for Ruby on Rails

## Version 1.5.0

* Add insecure direct object reference detection for all MVC frameworks (including Rack)
* SQL Injection detection: it must be done for all MVC frameworks (including Rack)
* Add automatic mitigation patch generation
* Add support for Javascript

# Spinoff projects

Dawnscanner is a security scanner for ruby code. Modern web applications
however are wrote in a plenty of great technologies deserving a good tool for
security scan.

Node.js and Go are very promising programming languages and a tool similiar to
Dawnscanner can be wrote also to support them:

Initially they were in the Dawnscanner roadmap for a 2.0.0 version. However
we decide to drop this in the name of being focused on ruby programming
language.
