# Codesake::Dawn - The security code scanner for Ruby

Codesake::Dawn is a source code scanner designed to review your code for
security issues. 

Codesake::Dawn is able to scan your ruby standalone programs but its main usage
is to deal with web applications. It supports applications written using majors
MVC (Model View Controller) frameworks, like: 

* [Ruby on Rails](http://rubyonrails.org)
* [Sinatra](http://www.sinatrarb.com)
* [Padrino](http://www.padrinorb.com) 

---

[![Gem Version](https://badge.fury.io/rb/codesake-dawn.png)](http://badge.fury.io/rb/codesake-dawn)
[![Build Status](https://travis-ci.org/codesake/codesake-dawn.png?branch=master)](https://travis-ci.org/codesake/codesake-dawn)
[![Dependency Status](https://gemnasium.com/codesake/codesake-dawn.png)](https://gemnasium.com/codesake/codesake-dawn)
[![Coverage Status](https://coveralls.io/repos/codesake/codesake-dawn/badge.png)](https://coveralls.io/r/codesake/codesake-dawn)

---

Codesake::Dawn version 1.0 has 131 security checks loaded in its knowledge
base. Most of them are CVE bulletins, that applies to gems, framework or the
ruby interpreter itself.

You candump all security checks in the knowledge base by using the -k
flag:

```
$ dawn -k|--list-knowledge-base 
```


When you run Codesake::Dawn on your code it parses your project Gemfile.lock
looking for the gems used and it tries to detect the ruby interpreter version
you are using or you declared in your ruby version management tool you like
most (RVM, rbenv, ...).

Then the tool tries to detect the MVC framework your web application uses and
it applies the security check accordingly. There checks designed to match rails
application or checks that are appliable to any ruby code.

Codesake::Dawn can also understand the code in your views and to backtrack
sinks to spot cross site scripting and sql injections introduced by the code
you actually wrote. In the project roadmap this is the code most of the future
development effort will be focused on.

Codesake::Dawn security scan result is a list of vulnerabilities with some
mitigation actions you want to follow in order to build a stronger web
application.

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

Underlying MVC framework is autodetected by dawn using target Gemfile.lock
file. If autodetect fails for some reason, the tool will complain about it and
you have to specify if it's a rails, sinatra or padrino web application by
hand.

Basic usage is to specify some optional command line option to fit best your
needs, and to specify the target directory where your code is stored.

``` 
$ dawn [options] target
```

In case of need, there is a quick command line option reference running ```dawn -h``` at your OS prompt.

```
$ bundle exec dawn -h
08:05:21 [*] dawn v1.0.0.rc1 is starting up
Usage: dawn [options] target_directory


Examples:$ dawn a_sinatra_webapp_directory
$ dawn -C the_rails_blog_engine
$ dawn -C --output json a_sinatra_webapp_directory

   -r, --rails					force dawn to consider the target a rails application
   -s, --sinatra				force dawn to consider the target a sinatra application
   -p, --padrino				force dawn to consider the target a padrino application
   -G, --gem-lock				force dawn to scan only for vulnerabilities affecting dependencies in Gemfile.lock
   -D, --debug					enters dawn debug mode
   -f, --list-known-framework			list ruby MVC frameworks supported by dawn
   -k, --list-knowledgebase [check_name]	list dawn known security checks. If check_name is specified dawn says if check is present or not
   -o, --output [console, json. csv, html]	the output will be in the specified format
   -V, --verbose				the output will be more verbose
   -C, --count-only				dawn will only count vulnerabilities (useful for scripts)
   -z, --exit-on-warn				dawn will return number of found vulnerabilities as exit code
   -v, --version				show version information
   -h, --help					show this help
```

### Codesake::Dawn security scan in action

As output, dawn will put all security checks that are failed during the scan.

This the result of Codedake::Dawn running against a 
[Sinatra 1.4.2 web application](https://github.com/thesp0nge/railsberry2013) wrote for a talk I
delivered in 2013 at [Railsberry conference](http://www.railsberry.com).

As you may see, Codesake::Dawn first detects MVC running the application by
looking at Gemfile.lock, than it discards all security checks not appliable to
Sinatra (49 security checks, in version 1.0, especially designed for Ruby on
Rails) and it applies them.

``` 
$ bundle exec dawn ~/src/hacking/railsberry2013
08:09:47 [*] dawn v1.0.0.rc1 is starting up
08:09:47 [$] dawn: scanning /Users/thesp0nge/src/hacking/railsberry2013
08:09:47 [$] dawn: sinatra v1.4.2 detected
08:09:47 [$] dawn: applying all security checks
08:09:47 [$] dawn: 82 security checks applied - 0 security checks skipped
08:09:47 [$] dawn: 1 vulnerabilities found
08:09:47 [$] dawn: CVE-2013-1800 failed
08:09:47 [$] dawn: Description: The crack gem 0.3.1 and earlier for Ruby does not properly restrict casts of string values, which might allow remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) by leveraging Action Pack support for (1) YAML type conversion or (2) Symbol type conversion, a similar vulnerability to CVE-2013-0156.
08:09:47 [$] dawn: Solution: Please use crack gem version 0.3.2 or above. Correct your gemfile
08:09:47 [!] dawn: Evidence:
08:09:47 [!] dawn: Vulnerable crack gem version found: 0.3.1
08:09:47 [*] dawn is leaving
``` 

---

When you run Codesake::Dawn on a web application with up to date dependencies,
it's likely to return a friendly _no vulnerabilities found_ message. Keep it up
working that way!

This is Codesake::Dawn running against a Padrino web application I wrote for [a
scorecard quiz game about application security](http://scorecard.armoredcode.com). 
Italian language only. Sorry.

```
08:17:09 [*] dawn v1.0.0.rc1 is starting up
08:17:09 [$] dawn: scanning /Users/thesp0nge/src/CORE_PROJECTS/scorecard
08:17:09 [$] dawn: padrino v0.11.2 detected
08:17:09 [$] dawn: applying all security checks
08:17:09 [$] dawn: 82 security checks applied - 0 security checks skipped
08:17:09 [*] dawn: no vulnerabilities found.
08:17:09 [*] dawn is leaving
```

---

Last example shows Codesake::Dawn against a very simple Sinatra application
designed to be buggy:

```
$ dawn target
08:28:18 [*] dawn v1.0.0.rc1 is starting up
08:28:18 [$] dawn: scanning /Users/thesp0nge/tmp/sinatra-vulnerable
08:28:18 [$] dawn: sinatra v1.2.6 detected
08:28:18 [$] dawn: applying all security checks
08:28:18 [$] dawn: 82 security checks applied - 0 security checks skipped
08:28:18 [$] dawn: 5 vulnerabilities found
08:28:18 [$] dawn: Not revised code failed
08:28:18 [$] dawn: Description: Analyzing comments, it seems your code is waiting from some review from you. Please consider take action before putting it in production.
This check will analyze the source code looking for the following patterns: XXX, TO_CHECK, CHECKME, CHECK and FIXME
08:28:18 [$] dawn: Solution: Please review the file fixing the issue.
08:28:18 [!] dawn: Evidence:
08:28:18 [!] dawn: {:filename=>"/Users/thesp0nge/tmp/sinatra-vulnerable/application.rb", :matches=>[{:match=>"# FIXME: I must raise an error here\n", :line=>30}]}
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

---

## Useful links

Project homepage: [http://dawn.codesake.com](http://dawn.codesake.com) 

Twitter progile:  [@dawnscanner](https://twitter.com/dawnscanner)

Github repository:   [https://github.com/codesake/codesake\-dawn](https://github.com/codesake/codesake-dawn)

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

Copyright (c) 2013, 2014 Paolo Perego

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

