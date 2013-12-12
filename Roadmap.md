# Codesake Dawn - roadmap

Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks. 

This is an ongoing roadmap for the dawn source code review tool.

_latest update: Fri 17 May 2013 15:29:55 CEST_

## Version 0.50 (2013-05-13) - First public release

* adding test for CVE\_2013\_0269
* adding test for CVE\_2013\_0155
* adding test for CVE\_2011\_2931
* adding test for CVE\_2012\_3465

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

## Version 0.80

* adding test for CVE-2013-4164
* adding test for CVE-2013-4457
* adding test for CVE-2013-4562
* added a '-z' flag to exit the process with the number of issues found as exit code
* added a Cross Site Scripting in Simple Form gem
* adding test for CVE-2013-4492
* adding test for CVE-2013-4491
* adding test for CVE-2013-6415


## Version 0.90

* adding test for CVE-2013-2090 _if CVE will be approved_
* adding test for CVE-2013-2065 _if CVE will be approved_
* adding test for CVE-2011-3186
* adding test for CVE-2011-2197
* adding test for CVE-2011-2932
* adding test for CVE-2011-0447
* adding test for CVE-2011-0995
* adding test for CVE-2011-0446
* adding test for CVE-2011-2929
* adding test for CVE-2011-1005
* adding test for CVE-2010-3933
* adding test for CVE-2011-4319
* adding test for CVE-2011-3009
* adding test for CVE-2011-1004
* adding test for CVE-2010-3119
* adding test for CVE-2011-2930
* adding test for CVE-2011-2854
* adding test for CVE-2011-3187
* adding test for CVE-2011-2686
* adding test for CVE-2011-2705
* adding test for CVE-2011-0188
* adding test for CVE-2011-0446
* adding test for CVE-2010-3933
* adding test for CVE-2011-0739
* adding test for CVE-2010-3928
* adding test for CVE-2008-7248
* adding test for CVE-2009-4124
* adding test for CVE-2010-0541
* adding test for CVE-2010-2489
* adding test for CVE-2009-3857
* adding test for CVE-2009-4078
* adding test for CVE-2009-4214
* adding test for CVE-2008-4310
* adding test for CVE-2009-0161
* adding test for CVE-2008-5189
* adding test for CVE-2008-3657
* adding test for CVE-2008-2376
* adding test for CVE-2008-3655
* adding test for CVE-2008-1145
* adding test for CVE-2008-1891
* adding test for CVE-2008-2725
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

## Version 1.00

* adding test for CVE-2008-4310
* adding test for CVE-2008-3657
* adding test for CVE-2008-1891
* adding test for CVE-2007-5162
* adding test for CVE-2006-5467
* adding test for CVE-2004-0983
* adding test for CVE-2008-4094
* adding test for CVE-2008-1447
* adding test for CVE-2007-6612
* adding test for CVE-2007-2666
* adding test for CVE-2006-4112
* adding test for CVE-2008-3905
* adding test for CVE-2008-2662
* adding test for CVE-2007-6183
* adding test for CVE-2007-2383
* adding test for CVE-2006-3694
* adding test for CVE-2008-3790
* adding test for CVE-2008-2663
* adding test for CVE-2007-6077
* adding test for CVE-2006-6979
* adding test for CVE-2007-6183
* adding test for CVE-2007-2383
* adding test for CVE-2006-3694
* adding test for CVE-2007-2666
* adding test for CVE-2006-4112
* adding test for CVE-2007-5770
* adding test for CVE-2007-0469
* adding test for CVE-2006-1931
* adding test for CVE-2007-5380
* adding test for CVE-2006-6303
* adding test for CVE-2005-1992
* adding test for CVE-2007-6077
* adding test for CVE-2006-6979
* adding test for CVE-2006-2582
* adding test for CVE-2007-5162
* adding test for CVE-2006-5467
* adding test for CVE-2004-0983
* adding test for CVE-2007-5379
* adding test for CVE-2006-6852
* adding test for CVE-2005-2337
* adding test for CVE-2005-1992
* adding test for CVE-2004-0755
* adding test for CVE-2004-0983
* dedicated web site under dawn.codesake.com
* detect SQLi in Rails applications
* integration with [codesake.com](http://codesake.com) with a public available
  APIs to be consumed by codesake users.
* automatic mitigation patch generation 

## Version 1.50

* support for node.js
