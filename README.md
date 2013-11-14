# Codesake::Dawn - code review engine for ruby powered code

Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks. 

[![Gem Version](https://badge.fury.io/rb/codesake-dawn.png)](http://badge.fury.io/rb/codesake-dawn)
[![Build Status](https://travis-ci.org/codesake/codesake-dawn.png?branch=master)](https://travis-ci.org/codesake/codesake-dawn)
[![Dependency Status](https://gemnasium.com/codesake/codesake-dawn.png)](https://gemnasium.com/codesake/codesake-dawn)
[![Coverage Status](https://coveralls.io/repos/codesake/codesake-dawn/badge.png)](https://coveralls.io/r/codesake/codesake-dawn)

## Useful links

www:      [http://codesake.com](http://codesake.com) 

twitter:  [https://twitter.com/codesake](https://twitter.com/codesake) #dawnscanner hashtag

github:   [https://github.com/codesake/codesake\-dawn](https://github.com/codesake/codesake-dawn)

## Installation

You can install dawn, directly using [Rubygems](https://rubygems.org) by typing:

    gem 'codesake-dawn'

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
08:34:53 [*] dawn v0.79.99 is starting up
08:34:54 [$] dawn: scanning target
08:34:54 [$] dawn: sinatra v1.4.2 detected
08:34:54 [$] dawn: applying all security checks
08:34:54 [$] dawn: 32 security checks applied - 0 security checks skipped
08:34:54 [$] dawn: 1 vulnerabilities found
08:34:54 [$] dawn: CVE-2013-1800 failed
08:34:54 [$] dawn: Solution: Please use crack gem version 0.3.2 or above. Correct your gemfile
08:34:54 [!] dawn: Evidence:
08:34:54 [!] dawn: Vulnerable crack gem version found: 0.3.1
08:34:54 [*] dawn is leaving
```


You can also dump all security checks in the knowledge base by using the -k
flag:

```
$ dawn -k|--list-knowledge-base 
```

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

