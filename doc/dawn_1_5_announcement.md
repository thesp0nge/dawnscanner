## Press announcement

Today, the December 9th 2015, the fifth, and last, minor dawnscanner rubygem
version it has been released.

dawnscanner is a source code scanner designed to review your code for
security issues.

dawnscanner is able to scan your ruby standalone programs but its main usage
is to deal with web applications. It supports applications written using majors
MVC (Model View Controller) frameworks, like:

* [Ruby on Rails](http://rubyonrails.org)
* [Sinatra](http://www.sinatrarb.com)
* [Padrino](http://www.padrinorb.com)

dawnscanner version 1.5.0 has 209 security checks loaded in its knowledge
base. Most of them are CVE bulletins applying to gems or the ruby interpreter
itself. There are also some check coming from Owasp Ruby on Rails cheatsheet.

Writing safe code it's important, but sometimes security issues are introduced
by third party code your application relies on. As example, consider a SQL
Injection vulnerability introduced by Ruby on Rails framework.

Despite the effort you spend in sanitizing inputs, your web application
inherits the vulnerability suffering as well. An attacker can easily exploit it
and break into your database unless you upgrade the offended gem.

There is a comprehensive set of command line flags you can read more by issuing
```dawn --list-knowledge-base``` flag or by reading [project
README](https://github.com/codesake/codesake-dawn/raw/master/README.md) file.

The list of security checks included in version 1.5.0 can be found online at:
[http://dawnscanner.org/knowledge-base.html](http://dawnscanner.org/knowledge-base.html).

You can use [facilities provided by
github](https://github.com/thesp0nge/dawnscanner/issues) to submit bug
reports, product enhancements, new security checks you want to me to add in
future releases and even success stories.

Now it's time for you to install dawnscanner version 1.5.0 with the
following command and start reviewing your code for security issues:

```
$ gem install -P MediumSecurity dawnscanner
```

You can find the announcement on the web here: [http://dawnscanner.org/announce-codesake-dawn-v1-5-0-released.html/](http://dawnscanner.org/announce-codesake-dawn-v1-5-0-released.html/)
Enjoy it!
Paolo - paolo@dawnscanner.org

## Twitter announcement

### version 1.5.0
@dawnscanner version 1.5.0 is out. 209 security checks, SQLite3 integration, better reports and tons of bug fixes. Read the announcement here: http://dawnscanner.org/announce-codesake-dawn-v1-5-0-released.html/ #ruby #rails #sinatra #padrino #security #appsec #cyber

## Linkedin announcement

### version 1.5.0
@dawnscanner version 1.5.0 is out. Read the announcement online. dawnscanner makes security code review fun for ruby developers, it scans 209 CVE and OSVDB bulletins and future release will be able to scan custom ruby code for XSS, SQL Injections and business logic flaws. It supports Sinatra, Padrino and Ruby on Rails MVC frameworks out of the box.

$ gem install dawnscanner
$ have fun

## HN Link
## Reddit
