
## Press announcement

After 9 months of development, it's now time for Codesake::Dawn security source
code scanner first major release.

Codesake::Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks. 

Version 1.0 introduces 142 security checks against public bulletins since 2006,
you can use to check the vulnerabilities introduced by third party libraries
your web application include in its Gemfile.

Writing safe code it's important, but sometimes security issues are introduced
by third party code your application relies on. As example, consider a SQL
Injection vulnerability introduced by Ruby on Rails framework. Despite the
effort you spend in sanitize inputs, your web application inherits the
vulnerability suffering as well. An attacker can easily exploit it and break
into your database unless you upgrade the offended gem.

There is a comprehensive set of command line flags you can read more by issuing
```dawn -h``` flag or by reading [project README](https://github.com/codesake/codesake-dawn/raw/master/README.md) file.

The list of security checks included in version 1.0.0 can be found online at:
[http://dawn.codesake.com/knowledge-base](http://dawn.codesake.com/knowledge-base).

You can use [facilities provided by
github](https://github.com/codesake/codesake-dawn/issues) to submit bug
reports, product enhancements, new security checks you want to me to add in
future releases and even success stories.

Now it's time for you to install Codesake::Dawn version 1.0.0 with the
following command and start reviewing your code for security issues:

``` 
$ gem install codesake-dawn
```

You can find the announcement on the web here: [http://dawn.codesake.com/blog/announce-codesake-dawn-v1-0-0-released/](http://dawn.codesake.com/blog/announce-codesake-dawn-v1-0-0-released/)
Enjoy it!
Paolo - paolo@codesake.com

## Twitter announcement

### version 1.0.6

@dawnscanner version 1.0.6 is out. A new security check: CVE-2014-2538 #ruby #security #rails #sinatra #padrino

### version 1.0.5

@dawnscanner version 1.0.5 is out. 2 new security checks: CVE-2014-2322 and CVE-2014-0036 #ruby #security #rails #sinatra #padrino

### version 1.0.4

@dawnscanner version 1.0.4 is out. 10 security checks actually in development were backported to master release. https://twitter.com/rubygems/status/444389931851718656 #ruby #security #rails

### version 1.0.3

@dawnscanner version 1.0.3 is out. It fixes the rake task that it wasn't available. https://github.com/codesake/codesake-dawn/issues/37 #sinatra #padrino #rails

### version 1.0.2

@dawnscanner version 1.0.2 is out. It fixes an annoying bug whit rainbow gem 2.0.0 #sinatra #padrino #rubyonrails #security #scanner 

### version 1.0.1

@dawnscanner version 1.0.1 is out. It fixes two minor issues about #owasp #rubyonrails #cheatsheet #sinatra #padrino #security #scanner 

### version 1.0.0
@dawnscanner version 1.0.0 is out. Read the announcement: http://dawn.codesake.com/blog/announce-codesake-dawn-v1-0-0-released/ #ruby #rails #sinatra #padrina #security #scanner


## Linkedin announcement 

### version 1.0.6

@dawnscanner version 1.0.6 is out. You can read the announcement here: http://dawn.codesake.com/blog/announce-codesake-dawn-v1-0-6-released/
Codesake::Dawn v1.0.6 introduces a newly released CVE bullettin: CVE-2014-2538 about a reflected xss in rack-ssl rubygem. Codesake::Dawk supports Sinatra, Padrino and Ruby on Rails MVC frameworks out of the box.

$ gem install codesake-dawn 
$ have fun

### version 1.0.5

@dawnscanner version 1.0.5 is out. You can read the announcement here: http://dawn.codesake.com/blog/announce-codesake-dawn-v1-0-5-released/
Codesake::Dawn v1.0.5 introduces 2 newly released CVE bullettins: CVE-2014-006 and CVE-2014-2322 about a MitM Spoofing Weakness in rbovirt gem and command injection in arabic prawn gem. Codesake::Dawk supports Sinatra, Padrino and Ruby on Rails MVC frameworks out of the box.

$ gem install codesake-dawn 
$ have fun

### version 1.0.4

@dawnscanner version 1.0.4 is out. You can read the announcement here: http://dawn.codesake.com/blog/announce-codesake-dawn-v1-0-4-released/
Codesake::Dawn v1.0.4 introduces 10 security checks backported from upcoming version 1.1.x and released in the latest months. Now the knowledge base has 152 security checks. Codesake::Dawk supports Sinatra, Padrino and Ruby on Rails MVC frameworks out of the box.

$ gem install codesake-dawn 
$ have fun

### version 1.0.3
@dawnscanner version 1.0.3 is out. Read the announcement online. Codesake::Dawn makes security code review fun for ruby developers, it scans 142 CVE bulletins and future release will be able to scan custom ruby code for XSS, SQL Injections and business logic flaws. It supports Sinatra, Padrino and Ruby on Rails MVC framework out of the box. 

Now you can add the ```require 'codesake/dawn/tasks'``` line in your Rakefile taking advantages from the rake ```dawn:run``` task

https://twitter.com/rubygems/status/433913686659702784

$ gem install codesake-dawn 
$ have fun

### version 1.0.2
@dawnscanner version 1.0.2 is out. Read the announcement online. Codesake::Dawn makes security code review fun for ruby developers, it scans 142 CVE bulletins and future release will be able to scan custom ruby code for XSS, SQL Injections and business logic flaws. It supports Sinatra, Padrino and Ruby on Rails MVC framework out of the box. 


https://twitter.com/rubygems/status/427768158284677120

$ gem install codesake-dawn 
$ have fun

### version 1.0.1
@dawnscanner version 1.0.1 is out. Read the announcement online. Codesake::Dawn makes security code review fun for ruby developers, it scans 142 CVE bulletins and future release will be able to scan custom ruby code for XSS, SQL Injections and business logic flaws. It supports Sinatra, Padrino and Ruby on Rails MVC framework out of the box. 

https://twitter.com/rubygems/status/427066100367777792

$ gem install codesake-dawn 
$ have fun

### version 1.0.0
@dawnscanner version 1.0.0 is out. Read the announcement online. Codesake::Dawn makes security code review fun for ruby developers, it scans 142 CVE bulletins and future release will be able to scan custom ruby code for XSS, SQL Injections and business logic flaws. It supports Sinatra, Padrino and Ruby on Rails MVC framework out of the box. 

$ gem install codesake-dawn 
$ have fun

## HN Link
https://news.ycombinator.com/item?id=7094470
## Reddit
http://www.reddit.com/r/security/comments/1vr4ur/ann_codesakedawn_v100_released/
http://www.reddit.com/r/ruby/comments/1vr4u0/ann_codesakedawn_v100_released/

