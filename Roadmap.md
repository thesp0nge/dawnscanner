# Codesake Dawn - roadmap

Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks. 

This is an ongoing roadmap for the dawn source code review tool.

_latest update: Fri Jan 10 17:06:04 CET 2014_

## Version 1.0.0

* CVE-2013-5647
* CVE-2013-4593
* CVE-2013-4489
* CVE-2013-4413
* CVE-2013-2516
* CVE-2013-2513
* CVE-2013-2512
* CVE-2013-2119
* CVE-2013-1878
* CVE-2013-1876
* CVE-2013-1756
* CVE-2013-1607
* CVE-2013-0263
* CVE-2013-0256
* CVE-2013-0162
* CVE-2012-2671
* CVE-2012-2139
* CVE-2012-1098
* CVE-2007-6183

## Version 1.1.0

* CVE-2014-1234
* CVE-2014-1233
* CVE-2013-5671
* move is\_vulnerable\_version? and is\_vulnerable\_patchlevel? to an adhoc class handling version comparison
* add @rubysec vulnerability database integration using rake
* create a task to check for new CVE in NVD website
* add a language check. It will handle a ruby script as input and a ruby\_parser line as unsafe pattern. It will compile the ruby and look for the unsafe pattern
* add a check against deprecated ruby / gems version. I will handle MVC gems right now.

## Version 1.2.0

* adding test for RoRCheatSheet\_2
* adding test for RoRCheatSheet\_3
* adding test for RoRCheatSheet\_5
* adding test for RoRCheatSheet\_6
* adding test for RoRCheatSheet\_9
* adding test for RoRCheatSheet\_10
* adding test for RoRCheatSheet\_11
* adding test for RoRCheatSheet\_12
* adding test for RoRCheatSheet\_13
* adding test for RoRCheatSheet\_14
* adding test for RoRCheatSheet\_15
* adding test for RoRCheatSheet\_16
* preliminary javascript support
* adding test for CVE-2011-4969  XSS in jquery < 1.6.2 
* detect stored XSS in Rails applications
* detect reflected XSS in Rails applications
* detect insecure direct object reference in Rails applications
* detect SQLi in Sinatra applications
* detect SQLi in Padrino applications
* detect sinks for XSS in Padrino applications
* detect reflected XSS in Padrino applications
* detect stored XSS in Sinatra applications
* detect stored XSS in Padrino applications
* detect insecure direct object reference in Sinatra applications
* detect insecure direct object reference in Padrino applications
* support ERB for in detect\_views (for both Sinatra and Padrino)
* integration with [codesake.com](http://codesake.com) with a public available
  APIs to be consumed by codesake beta users.
* dedicated web site under dawn.codesake.com
* detect SQLi in Rails applications
* integration with [codesake.com](http://codesake.com) with a public available
  APIs to be consumed by codesake users.
* automatic mitigation patch generation 

## Version 2.0.0
* Add a --github option to dawn to clone a remote repository, perform a bundle install and do a code review.
* node.js support
