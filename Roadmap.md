# Codesake Dawn - roadmap

Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks. 

This is an ongoing roadmap for the dawn source code review tool.

_latest update: Thu Jan  9 08:58:00 CET 2014_

## Version 1.0.0

* add a language check. It will handle a ruby script as input and a ruby\_parser line as unsafe pattern. It will compile the ruby and look for the unsafe pattern
* add a check against deprecated ruby / gems version. I will handle MVC gems right now.
* adding test for CVE-2011-2854
* adding test for CVE-2011-0446
* adding test for CVE-2008-3657
* adding test for CVE-2008-2376
* adding test for CVE-2008-3655
* adding test for CVE-2008-1145
* adding test for CVE-2008-1891
* adding test for CVE-2008-2725
* adding test for CVE-2008-3657
* adding test for CVE-2008-1891
* adding test for CVE-2007-5162
* adding test for CVE-2004-0983
* adding test for CVE-2008-1447
* adding test for CVE-2007-6612
* adding test for CVE-2007-2666
* adding test for CVE-2008-2662
* adding test for CVE-2007-6183
* adding test for CVE-2007-2383
* adding test for CVE-2008-3790
* adding test for CVE-2008-2663
* adding test for CVE-2007-6077
* adding test for CVE-2007-6183
* adding test for CVE-2007-2383
* adding test for CVE-2007-2666
* adding test for CVE-2007-5770
* adding test for CVE-2007-5380
* adding test for CVE-2005-1992
* adding test for CVE-2007-6077
* adding test for CVE-2007-5162
* adding test for CVE-2004-0983
* adding test for CVE-2007-5379
* adding test for CVE-2004-0983

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

## Version 1.50

* support for node.js
