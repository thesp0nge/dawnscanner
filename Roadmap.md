# Codesake Dawn - roadmap

Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks. 

This is an ongoing roadmap for the dawn source code review tool.

_latest update: Thu May 16 07:57:39 CEST 2013_

## Version 0.50 (2013-05-13) - First public release

* adding test for CVE\_2013\_0269
* adding test for CVE\_2013\_0155
* adding test for CVE\_2011\_2931
* adding test for CVE\_2012\_3465

## Version 0.60

* adding test for CVE-2013-1854
* adding test for CVE-2013-1856
* adding test for CVE-2013-0276
* adding test for CVE-2013-0277
* adding test for CVE-2013-0156
* adding cucumber dependency
* make output less verbose. Only vulnerabilities and severity will be shown 
* adding a '--verbose' option to see also the whole knowledge base info about each findings
* adding a '--output' option
* support JSON output
* grepping views for XSS attempts (sinatra)

## Version 0.70 

* adding test for CVE-2012-3464
* adding text for CVE-2012-3463
* adding text for CVE-2012-5664
* add ruby\_parser dependency
* support sinatra application controllers parsing for XSS
* grepping views for XSS attempts (rails)

## Version 0.80

* adding text for CVE-2011-0447 
* adding text for CVE-2011-0446 
* support sinatra application controllers parsing for SQLi
* support rails application controllers parsing for XSS
* grepping views for XSS attempts (padrino)

## Version 1.00

* dedicated web site under dawn.codesake.com
* support rails application controllers parsing for SQLi
* support padrino application controllers parsing for XSS
* support padrino application controllers parsing for SQLi
* integration with [codesake.com](http://codesake.com) with a public available
  APIs to be consumed by codesake users.
* automatic mitigation patch generation 

## Version 1.50

* support for node.js
