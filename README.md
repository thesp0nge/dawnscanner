# Dawnscanner - The raising security scanner for ruby web applications

dawn is a source code scanner designed to review your web applications for
security issues.

The tool is able to scan web applications written in Ruby and it supports all
major MVC (Model View Controller) frameworks, out of the box:

* [Ruby on Rails](http://rubyonrails.org)
* [Sinatra](http://www.sinatrarb.com)
* [Padrino](http://www.padrinorb.com)

---

[![Gem Version](https://badge.fury.io/rb/dawnscanner.png)](http://badge.fury.io/rb/dawnscanner)
[![Build Status](https://travis-ci.org/thesp0nge/dawnscanner.png?branch=master)](https://travis-ci.org/thesp0nge/dawnscanner)
[![Coverage Status](https://coveralls.io/repos/thesp0nge/dawnscanner/badge.png)](https://coveralls.io/r/thesp0nge/dawnscanner)
[![Code Triagers Badge](https://www.codetriage.com/thesp0nge/dawnscanner/badges/users.svg)](https://www.codetriage.com/thesp0nge/dawnscanner)
[![Inline docs](http://inch-ci.org/github/thesp0nge/dawnscanner.png?branch=master)](http://inch-ci.org/github/thesp0nge/dawnscanner)
[![Gitter](https://badges.gitter.im/thesp0nge/dawnscanner.svg)](https://gitter.im/thesp0nge/dawnscanner?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

---

dawn version 2.0 has 680+ security checks loaded in its knowledge base
which is weekly updated from the [National Vulnerability
Database](https://nvd.nist.gov/) by NIST.

## A brief "how it works"

When you run dawn on your code it parses your project Gemfile.lock
looking for the gems used and it tries to detect the ruby interpreter version
you are using or you declared in your ruby version management tool you like
most (RVM, rbenv, ...).

Then the tool tries to detect the MVC framework your web application uses and
it applies the security check accordingly. There checks designed to match rails
application or checks that are appliable to any ruby code.

dawn can also understand the code in your views and to backtrack
sinks to spot cross site scripting and sql injections introduced by the code
you actually wrote **(in the project roadmap this is the code most of the future
development effort will be focused on).**

dawn security scan result is a list of vulnerabilities with some
mitigation actions you want to follow in order to build a stronger web
application.

## Installation

You can install latest dawn version, fetching it from
[Rubygems](https://rubygems.org) by typing:

```
$ gem install dawnscanner
```

After that, you need to download the [knowledge
base](https://github.com/thesp0nge/dawnscanner_knowledge_base/releases) from
Github and unpack the archive to ```$HOME/dawnscanner/kb``` directory.

A typical kb directory layout is similar to this:

```
$ ll ~/dawnscanner/kb
total 56K
drwxr-xr-x 2 thesp0nge users  28K 29 mar 18.27 bulletin
drwxr-xr-x 2 thesp0nge users   72  7 lug  2021 generic_check
-rw-r--r-- 1 thesp0nge users   65 29 mar 17.06 kb.yaml
-rw-r--r-- 1 thesp0nge users   74 29 mar 17.06 kb.yaml.sig
drwxr-xr-x 2 thesp0nge users 4,0K  7 lug  2021 owasp_ror_cheatsheet
```

The knowledge base is structured this way:
* bulletin is the folder where all CVE downloaded from NIST are stored.
* generic_check is the folder with all custom checks for your code
* owasp_ror_cheatsheet is for the Owasp Ruby on Rails cheatsheet
  recomendations

## Usage

Starting from version 2.0, the tool uses subcommands to start specific tasks,
each of them with specific help messages.

### Scanning a project

The scan subcommand tells dawn to scan the specified target for security
issues.

```
$ dawn scan target
```

At the moment results are available in text format only and they are stored in
a directory named with the scan timestamp, under
$HOME/dawnscanner/results/target, where target is the name of the application
being analyzed.

### Querying the knowledge base

Is it possible, with the kb subcommand, to query the knowledge base.

```
dawn kb find                        # Searches the knowledge base for a given vulnerability
dawn kb help [COMMAND]              # Describe subcommands or one specific subcommand
dawn kb lint                        # Checks knowledge base content for correcteness
dawn kb list gem_name[gem_version]  # List all security issues affecting a gem passed as argument (the version string is optional).
dawn kb status                      # Checks the status of the knowledge base
dawn kb unpack                      # Unpacks security checks in KB library path
```

## Useful links

Twitter profile:  [@dawnscanner](https://twitter.com/dawnscanner)
Github repository:   [https://github.com/thesp0nge/dawnscanner](https://github.com/thesp0nge/dawnscanner)


## Support us

Feedbacks are great and we really love to hear your voice.

If you're a proud dawn user, if you find it useful, if you integrated
it in your release process and if you want to openly support the project you
can put your reference here. Just open an
[issue](https://github.com/thesp0nge/dawnscanner/issues/new) with a statement saying
how do you feel the tool and your company logo if any.

Thank you.

## Thanks to

[saten](https://github.com/saten): first issue posted about a typo in the README

[presidentbeef](https://github.com/presidentbeef): for his outstanding work that inspired me creating dawn and for double check comparison matrix. Issue #2 is yours :)

[marinerJB](https://github.com/marinerJB): for misc bug reports and further ideas

[Matteo](https://github.com/matteocollina): for ideas on API and their usage with [github.com](https://github.com) hooks


## LICENSE

Copyright (c) 2013-2023 Paolo Perego <paolo@armoredcode.com>

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
