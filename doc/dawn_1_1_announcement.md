## Press announcement

The April 4th 2013, the first Codesake::Dawn import in Github happened. After
1 year and three months later than the first major released, I'm happy to
annonunce Codesake::Dawn 1.1.0, codename Lightning McQueen

Codesake::Dawn is a source code scanner designed to review your code for
security issues.

Codesake::Dawn is able to scan your ruby standalone programs but its main usage
is to deal with web applications. It supports applications written using majors
MVC (Model View Controller) frameworks, like:

* [Ruby on Rails](http://rubyonrails.org)
* [Sinatra](http://www.sinatrarb.com)
* [Padrino](http://www.padrinorb.com)

Codesake::Dawn version 1.1 has 171 security checks loaded in its knowledge
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

The list of security checks included in version 1.1.0 can be found online at:
[http://dawn.codesake.com/knowledge-base](http://dawn.codesake.com/knowledge-base).

You can use [facilities provided by
github](https://github.com/codesake/codesake-dawn/issues) to submit bug
reports, product enhancements, new security checks you want to me to add in
future releases and even success stories.

Now it's time for you to install Codesake::Dawn version 1.1.0 with the
following command and start reviewing your code for security issues:

```
$ gem install codesake-dawn
```

You can find the announcement on the web here: [http://dawn.codesake.com/blog/announce-codesake-dawn-v1-1-0-released/](http://dawn.codesake.com/blog/announce-codesake-dawn-v1-1-0-released/)
Enjoy it!
Paolo - paolo@codesake.com

## Twitter announcement

### version 1.1.0
@dawnscanner version 1.1.0 is out. 171 security checks. Improved output and more. Read the announcement: http://dawn.codesake.com/blog/announce-codesake-dawn-v1-1-0-released/ #ruby #rails #sinatra #padrina #security #scanner

## Linkedin announcement

### version 1.0.0
@dawnscanner version 1.1.0 is out. Read the announcement online. Codesake::Dawn makes security code review fun for ruby developers, it scans 171 CVE bulletins and future release will be able to scan custom ruby code for XSS, SQL Injections and business logic flaws. It supports Sinatra, Padrino and Ruby on Rails MVC frameworks out of the box.

$ gem install codesake-dawn
$ have fun

## HN Link
## Reddit
