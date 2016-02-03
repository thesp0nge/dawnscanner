# Dawnscanner - The raising security scanner for ruby web applications

dawnscanner is a source code scanner designed to review your ruby code for security
issues.

dawnscanner is able to scan plain ruby scripts (e.g. command line applications) but
all its features are unleashed when dealing with web applications source code.
dawnscanner is able to scan major MVC (Model View Controller) frameworks, out of the
box:

* [Ruby on Rails](http://rubyonrails.org)
* [Sinatra](http://www.sinatrarb.com)
* [Padrino](http://www.padrinorb.com)

---

[![Gem Version](https://badge.fury.io/rb/dawnscanner.png)](http://badge.fury.io/rb/dawnscanner)
[![Build Status](https://travis-ci.org/thesp0nge/dawnscanner.png?branch=master)](https://travis-ci.org/thesp0nge/dawnscanner)
[![Dependency Status](https://gemnasium.com/thesp0nge/dawnscanner.png)](https://gemnasium.com/thesp0nge/dawnscanner)
[![Coverage Status](https://coveralls.io/repos/thesp0nge/dawnscanner/badge.png)](https://coveralls.io/r/thesp0nge/dawnscanner)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/thesp0nge/dawnscanner/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
[![Inline docs](http://inch-ci.org/github/thesp0nge/dawnscanner.png?branch=master)](http://inch-ci.org/github/thesp0nge/dawnscanner)
[![Gitter](https://badges.gitter.im/thesp0nge/dawnscanner.svg)](https://gitter.im/thesp0nge/dawnscanner?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

---

dawnscanner version 1.5.2 has 209 security checks loaded in its knowledge
base. Most of them are CVE bulletins applying to gems or the ruby interpreter
itself. There are also some check coming from Owasp Ruby on Rails cheatsheet.

## An overall introduction

When you run dawnscanner on your code it parses your project Gemfile.lock
looking for the gems used and it tries to detect the ruby interpreter version
you are using or you declared in your ruby version management tool you like
most (RVM, rbenv, ...).

Then the tool tries to detect the MVC framework your web application uses and
it applies the security check accordingly. There checks designed to match rails
application or checks that are appliable to any ruby code.

dawnscanner can also understand the code in your views and to backtrack
sinks to spot cross site scripting and sql injections introduced by the code
you actually wrote. In the project roadmap this is the code most of the future
development effort will be focused on.

dawnscanner security scan result is a list of vulnerabilities with some
mitigation actions you want to follow in order to build a stronger web
application.

## Installation

dawnscanner rubygem is cryptographically signed. To be sure the gem you
install hasn’t been tampered, you must first add ```paolo@dawnscanner.org```
public signing certificate as trusted to your gem specific keyring.

```
$ gem cert --add <(curl -Ls https://raw.githubusercontent.com/thesp0nge/dawnscanner/master/certs/paolo_at_dawnscanner_dot_org.pem)
```

You can install latest dawnscanner version, fetching it from
[Rubygems](https://rubygems.org) by typing:

```
$ gem install dawnscanner -P MediumSecurity
```

The MediumSecurity trust profile will verify signed gems, but allow the
installation of unsigned dependencies. This is necessary because not all of
dawnscanner’s dependencies are signed, so we cannot use HighSecurity.

In order to install a release candidate version, the gem install command line
is the following:

```
$ gem install dawnscanner --pre -P MediumSecurity
```

If you want to add dawn to your project Gemfile, you must add the following:

    group :development do
      gem 'dawnscanner', :require=>false
    end

And then upgrade your bundle

    $ bundle install

You may want to build it from source, so you have to check it out from github first:

    $ git clone https://github.com/thesp0nge/dawnscanner.git
    $ cd dawnscanner
    $ bundle install
    $ rake install

And the dawnscanner gem will be built in a pkg directory and then installed
on your system. Please note that you have to manage dependencies on your own
this way. It makes sense only if you want to hack the code or something like
that.

## Usage

You can start your code review with dawnscanner very easily. Simply tell the tool
where the project root directory.

Underlying MVC framework is autodetected by dawnscanner using target Gemfile.lock
file. If autodetect fails for some reason, the tool will complain about it and
you have to specify if it's a rails, sinatra or padrino web application by
hand.

Basic usage is to specify some optional command line option to fit best your
needs, and to specify the target directory where your code is stored.

```
$ dawn [options] target
```

In case of need, there is a quick command line option reference running 
```dawn -h``` at your OS prompt.

```
$ dawn -h
Usage: dawn [options] target_directory

Examples:
  $ dawn a_sinatra_webapp_directory
  $ dawn -C the_rails_blog_engine
  $ dawn -C --json a_sinatra_webapp_directory
  $ dawn --ascii-tabular-report my_rails_blog_ecommerce
  $ dawn --html -F my_report.html my_rails_blog_ecommerce

   -r, --rails          force dawn to consider the target a rails application
   -s, --sinatra        force dawn to consider the target a sinatra application
   -p, --padrino        force dawn to consider the target a padrino application
   -G, --gem-lock       force dawn to scan only for vulnerabilities affecting dependencies in Gemfile.lock
   -a, --ascii-tabular-report   cause dawn to format findings using table in ascii art
   -j, --json                   cause dawn to format findings using json
   -C, --count-only             dawn will only count vulnerabilities (useful for scripts)
   -z, --exit-on-warn           dawn will return number of found vulnerabilities as exit code
   -F, --file filename          tells dawn to write output to filename
   -c, --config-file filename   tells dawn to load configuration from filename

Disable security check family

       --disable-cve-bulletins  disable all CVE security checks
       --disable-code-quality   disable all code quality checks
       --disable-code-style     disable all code style checks
       --disable-owasp-ror-cheatsheet   disable all Owasp Ruby on Rails cheatsheet checks
       --disable-owasp-top-10           disable all Owasp Top 10 checks

Flags useful to query dawnscanner

       -S, --search-knowledge-base [check_name]   search check_name in the knowledge base
           --list-knowledge-base                  list knowledge-base content
           --list-known-families                  list security check families contained in dawn's knowledge base
           --list-known-framework                 list ruby MVC frameworks supported by dawn

Service flags

   -D, --debug                                  enters dawn debug mode
   -V, --verbose                                the output will be more verbose
   -v, --version                                show version information
   -h, --help                                   show this help
```

### Rake task

To include dawnscanner in your rake task list, you simply have to put this line in
your ```Rakefile```

```
require 'dawn/tasks'
```

Then executing ```$ rake -T``` you will have a ```dawn:run``` task you want to
execute.

```
$ rake -T
...
rake dawn:run                  # Execute dawnscanner on the current directory
...
```

### Interacting with the knowledge base

You can dump all security checks in the knowledge base this way

```
$ dawn --list-knowledge-base
```

Useful in scripts, you can use ```--search-knowledge-base``` or ```-S``` with
as parameter the check name you want to see if it's implemented as a security
control or not.

```
$ dawn -S CVE-2013-6421
07:59:30 [*] dawn v1.1.0 is starting up
CVE-2013-6421 found in knowledgebase.

$ dawn -S this_test_does_not_exist
08:02:17 [*] dawn v1.1.0 is starting up
this_test_does_not_exist not found in knowledgebase
```

### dawnscanner security scan in action

As output, dawnscanner will put all security checks that are failed during the scan.

This the result of Codedake::dawnscanner running against a
[Sinatra 1.4.2 web application](https://github.com/thesp0nge/railsberry2013) wrote for a talk I
delivered in 2013 at [Railsberry conference](http://www.railsberry.com).

As you may see, dawnscanner first detects MVC running the application by
looking at Gemfile.lock, than it discards all security checks not appliable to
Sinatra (49 security checks, in version 1.0, especially designed for Ruby on
Rails) and it applies them.

```
$ dawn ~/src/hacking/railsberry2013
18:40:27 [*] dawn v1.1.0 is starting up
18:40:27 [$] dawn: scanning /Users/thesp0nge/src/hacking/railsberry2013
18:40:27 [$] dawn: sinatra v1.4.2 detected
18:40:27 [$] dawn: applying all security checks
18:40:27 [$] dawn: 109 security checks applied - 0 security checks skipped
18:40:27 [$] dawn: 1 vulnerabilities found
18:40:27 [!] dawn: CVE-2013-1800 check failed
18:40:27 [$] dawn: Severity: high
18:40:27 [$] dawn: Priority: unknown
18:40:27 [$] dawn: Description: The crack gem 0.3.1 and earlier for Ruby does not properly restrict casts of string values, which might allow remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) by leveraging Action Pack support for (1) YAML type conversion or (2) Symbol type conversion, a similar vulnerability to CVE-2013-0156.
18:40:27 [$] dawn: Solution: Please use crack gem version 0.3.2 or above. Correct your gemfile
18:40:27 [$] dawn: Evidence:
18:40:27 [$] dawn:      Vulnerable crack gem version found: 0.3.1
18:40:27 [*] dawn is leaving
```

---

When you run dawnscanner on a web application with up to date dependencies,
it's likely to return a friendly _no vulnerabilities found_ message. Keep it up
working that way!

This is dawnscanner running against a Padrino web application I wrote for [a
scorecard quiz game about application security](http://scorecard.armoredcode.com).
Italian language only. Sorry.

```
18:42:39 [*] dawn v1.1.0 is starting up
18:42:39 [$] dawn: scanning /Users/thesp0nge/src/CORE_PROJECTS/scorecard
18:42:39 [$] dawn: padrino v0.11.2 detected
18:42:39 [$] dawn: applying all security checks
18:42:39 [$] dawn: 109 security checks applied - 0 security checks skipped
18:42:39 [*] dawn: no vulnerabilities found.
18:42:39 [*] dawn is leaving
```

If you need a fancy HTML report about your scan, just ask it to dawnscanner
with the ```--html``` flag used with the ```--file``` since I wanto to save the
HTML to disk.

```
$ dawn /Users/thesp0nge/src/hacking/rt_first_app --html --file report.html

09:00:54 [*] dawn v1.1.0 is starting up
09:00:54 [*] dawn: report.html created (2952 bytes)
09:00:54 [*] dawn is leaving
```

---

## Useful links

Project homepage: [http://dawnscanner.org](http://dawnscanner.org)

Twitter profile:  [@dawnscanner](https://twitter.com/dawnscanner)

Github repository:   [https://github.com/thesp0nge/dawnscanner](https://github.com/thesp0nge/dawnscanner)

Mailing list: [https://groups.google.com/forum/#!forum/dawnscanner](https://groups.google.com/forum/#!forum/dawnscanner)

## Support us

Feedbacks are great and we really love to hear your voice.

If you're a proud dawnscanner user, if you find it useful, if you integrated
it in your release process and if you want to openly support the project you
can put your reference here. Just open an
[issue](https://github.com/thesp0nge/dawnscanner/issues/new) with a statement saying
how do you feel the tool and your company logo if any.

More easily you can drop an email to
[paolo@dawnscanner.org](mailto:paolo@dawnscanner.org) sending a statement about your
success story and I'll put on the website.

Thank you.

## Thanks to

[saten](https://github.com/saten): first issue posted about a typo in the README

[presidentbeef](https://github.com/presidentbeef): for his outstanding work that inspired me creating dawn and for double check comparison matrix. Issue #2 is yours :)

[marinerJB](https://github.com/marinerJB): for misc bug reports and further ideas

[Matteo](https://github.com/matteocollina): for ideas on API and their usage with [github.com](https://github.com) hooks

## Contribute to dawnscannerscanner

Are you interested in contributing to dawnscanner project? Great, here is
some very basic rules in order to make rocking pull requests.

First of all, I use the branching model described in [this
post](http://nvie.com/posts/a-successful-git-branching-model/). There are two
major branches:

* master: it contains in every moment the code for the latest dawnscanner
  released gem. You can't make branches from here unless you're working on a
  bugfix.
* development: it contains the unstable code that is going to be the next
  dawnscanner realease. You start from here. Pick a task on the Roadmap.md
  and create a separated branch to work on your feature to. When you're ready
  (remember to include also spec files), submit your pull request. If the code
  will be fine, it will be merged into the development tree ready to be include
  in upcoming gem version.

No branch from master it would be analyzed unless they are related to bugfix.
In this case, the branch name must be something like _issue\_#xx\_description_

## LICENSE

Copyright (c) 2013-2015 Paolo Perego <paolo@dawnscanner.org>

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




