# Codesake::Dawn - The security code review tool for ruby powered code

codesake-dawn is a source code review tool crafted to detect security issues in
ruby written code. The main usage is to apply codesake-dawn to web
applications, it supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and of course [Ruby on Rails](http://rubyonrails.org) frameworks. 

![Gem Version](https://badge.fury.io/rb/codesake-dawn.png)](http://badge.fury.io/rb/codesake-dawn)
[![Build Status](https://travis-ci.org/codesake/codesake-dawn.png?branch=master)](https://travis-ci.org/codesake/codesake-dawn)
[![Dependency Status](https://gemnasium.com/codesake/codesake-dawn.png)](https://gemnasium.com/codesake/codesake-dawn)
[![Coverage Status](https://coveralls.io/repos/codesake/codesake-dawn/badge.png)](https://coveralls.io/r/codesake/codesake-dawn)

## Useful links

www:      [http://dawn.codesake.com](http://dawn.codesake.com) 

twitter:  [https://twitter.com/dawnscanner](https://twitter.com/dawnscanner)

github:   [https://github.com/codesake/codesake\-dawn](https://github.com/codesake/codesake-dawn)

## Installation

You can install dawn, directly using [Rubygems](https://rubygems.org) by typing:

    gem install codesake-dawn

If you want to add dawn to your project Gemfile, you must add the following:
    
    group :development do
      gem 'codesake-dawn', :require=>false
    end

And then upgrade your bundle 

    $ bundle install

You may want to build it from source, so you have to check it out from github first:

    $ git clone https://github.com/codesake/codesake-dawn/codesake-dawn.git
    $ cd codesake-dawn
    $ rake install

And the codesake-dawn gem will be built in a pkg directory and then installed
on your system. Please note that you have to manage dependencies on your own
this way. It makes sense only if you want to hack the code or something like
that.

## Usage

You can start your code review with dawn very easily. Simply tell the tool
where the project root directory. 

Starting from an unofficial 0.68 release, underlying MVC framework is
autodetected by dawn using target Gemfile.lock file. If autodetect fails for
some reason, the tool will complain about it and you have to specify if it's a
rails, sinatra or padrino web application by hand.

dawn command line is in this form with options and the target.
``` 
$ dawn [options] target
```

### As output you get

As output, dawn will put all security checks that are failed during the scan.
In example, this is the output of a scan performed over a very simple Sinatra
application:

```
$ dawn target
8:28:18 [*] dawn v0.80.0 is starting up
08:28:18 [$] dawn: scanning spec/support/sinatra-vulnerable
08:28:18 [$] dawn: sinatra v1.2.6 detected
08:28:18 [$] dawn: applying all security checks
08:28:18 [$] dawn: 37 security checks applied - 0 security checks skipped
08:28:18 [$] dawn: 5 vulnerabilities found
08:28:18 [$] dawn: Not revised code failed
08:28:18 [$] dawn: Description: Analyzing comments, it seems your code is waiting from some review from you. Please consider take action before putting it in production.
This check will analyze the source code looking for the following patterns: XXX, TO_CHECK, CHECKME, CHECK and FIXME
08:28:18 [$] dawn: Solution: Please review the file fixing the issue.
08:28:18 [!] dawn: Evidence:
08:28:18 [!] dawn: {:filename=>"spec/support/sinatra-vulnerable/application.rb", :matches=>[{:match=>"# FIXME: I must raise an error here\n", :line=>30}]}
08:28:18 [$] dawn: CVE-2013-0269 failed
08:28:18 [$] dawn: Description: The JSON gem before 1.5.5, 1.6.x before 1.6.8, and 1.7.x before 1.7.7 for Ruby allows remote attackers to cause a denial of service (resource consumption) or bypass the mass assignment protection mechanism via a crafted JSON document that triggers the creation of arbitrary Ruby symbols or certain internal objects, as demonstrated by conducting a SQL injection attack against Ruby on Rails, aka "Unsafe Object Creation Vulnerability."
08:28:18 [$] dawn: Solution: Please upgrade JSON gem to version 1.5.5, 1.6.8 or 1.7.7 or latest version available
08:28:18 [!] dawn: Evidence:
08:28:18 [!] dawn: Vulnerable json gem version found: 1.4.6
08:28:18 [$] dawn: CVE-2013-1800 failed
08:28:18 [$] dawn: Description: The crack gem 0.3.1 and earlier for Ruby does not properly restrict casts of string values, which might allow remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) by leveraging Action Pack support for (1) YAML type conversion or (2) Symbol type conversion, a similar vulnerability to CVE-2013-0156.
08:28:18 [$] dawn: Solution: Please use crack gem version 0.3.2 or above. Correct your gemfile
08:28:18 [!] dawn: Evidence:
08:28:18 [!] dawn: Vulnerable crack gem version found: 0.3.1
08:28:18 [$] dawn: CVE-2013-4164 failed
08:28:18 [$] dawn: Description: Any time a string is converted to a floating point value, a specially crafted string can cause a heap overflow. This can lead to a denial of service attack via segmentation faults and possibly arbitrary code execution. Any program that converts input of unknown origin to floating point values (especially common when accepting JSON) are vulnerable.
08:28:18 [$] dawn: Solution: All users are recommended to upgrade to Ruby 1.9.3 patchlevel 484, ruby 2.0.0 patchlevel 353 or ruby 2.1.0 preview2.
08:28:18 [!] dawn: Evidence:
08:28:18 [!] dawn: ruby v2.0.0-p247 detected
08:28:18 [$] dawn: 1 reflected XSS found
08:28:18 [$] dawn: request parameter "name"
08:28:18 [*] dawn is leaving
```


You can also dump all security checks in the knowledge base by using the -k
flag:

```
$ dawn -k|--list-knowledge-base 
```

In the 0.80 gem version, there are 75 security checks designed for application written in ruby. 

## Supporters

To me as project leader it's very important to have feedbacks. I really want to
ear your voice. 

If you're a proud codesake-dawn user, if you find it useful, if you integrated
it in your release process and if you want to openly support the project you
can put your reference here.

You can support the project by forking the repo, adding a success story, a
statement saying how do you feel the tool or your company logo as well and then
submitting a pull request.

Thank you for your support.

## Thanks to

[saten](https://github.com/saten): first issue posted about a typo in the README

[presidentbeef](https://github.com/presidentbeef): for his outstanding work that inspired me creating dawn and for double check comparison matrix. Issue #2 is your :)

[marinerJB](https://github.com/marinerJB): for misc bug reports and further ideas

[Matteo](https://github.com/matteocollina): for ideas on API and their usage with [github.com](https://github.com) hooks

## LICENSE

Copyright (c) 2013 Paolo Perego

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

