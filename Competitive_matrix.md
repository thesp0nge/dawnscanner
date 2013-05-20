# Competitive matrix between dawn and other security static code scanners

This is the point where I try to answer the very good question: _dawn? it is a
great tool but which are the differences between it and ( put your favorite
tool here )?_

Of course, as you may wonder, I'm the dawn author so I can be less impartial
than a third party review that it is strongly encouraged and that it will put
linked to this page (even in case you will make criticisms to my tool)

## The competitors

As [@presidentbeef](https://twitter.com/presidentbeef) pointed me out, there
are a couple of security source code static analyzers (lets'call them SAST from
this point) supporting ruby.

* [brakeman scanner](http://brakemanscanner.org/) 
* [Excellent](https://github.com/simplabs/excellent)
* [ror-sec-scanner](http://gitorious.org/code-scanner/ror-sec-scanner/)
* [Scanny](https://github.com/openSUSE/scanny)
* [dawn](https://github.com/codesake/codesake\_dawn)

### Brakeman

[Brakeman](http://brakemanscanner.org) is a good tool, it is mature and it is
widespread among the community. It's approaching the second major release of
its history.

It is born to support [Ruby on Rails](http://rubyonrails.org) written web
applications.

### Dawn

Dawn is born to support the application security startup I'm building,
[codesake.com](http://codesake.com). Since community gives me a lot in all
these years, the statica analyzer will be opensource and **I won't change this
decision, ever**.

Dawn supports web applications written using 
[Ruby on Rails](http://rubyonrails.org), [Sinatra](http://sinatrarb.com) and
[Padrino](http://padrinorb.com)

Since a lot of javascript code is used in the web applications nowadays, I'll
introduce a preliminary support for javascript before launching version 1.0.
Javascript support it will be focused on checking for reflected and DOM based
Cross site scripting attacks.

In a future (on version 1.5 accordingly to the Roadmap), node.js written web
applications will be supported as well.

## The comparison

### Basic features

|Feature                | Dawn          | Brakeman          | Excellent   | ror-sec-scanner   | Scanny      |
|-----------------------|---------------|-------------------|-------------|-------------------|-------------|
| Version               | 0.51          | 1.9.5             |             |                   |             |
| Production ready?     | NO            | YES               |             |                   |             |
| Sinatra support       | YES           | NO                |             |                   |             |
| Padrino support       | NO *planned*  | NO                |             |                   |             |
| Rails support         | YES           | YES               |             |                   |             |
| Node.js support       | NO *planned*  | NO                |             |                   |             |
| Plain text output     | YES           | YES               |             |                   |             |
| Json output           | YES           | YES               |             |                   |             |
| HTML output           | NO            | YES               |             |                   |             |

### CVE security checks

| CVE Check             | Dawn          | Brakeman          | Excellent   | ror-sec-scanner   | Scanny      |
|-----------------------|---------------|-------------------|-------------|-------------------|-------------|
| CVE-2011-2931         | YES           | YES               |             |                   |             |
| CVE-2012-2660         | YES           | YES               |             |                   |             |
| CVE-2012-2661         | YES           | YES               |             |                   |             |
| CVE-2012-2694         | YES           | YES               |             |                   |             |
| CVE-2012-2695         | YES           | YES               |             |                   |             |
| CVE-2012-3465         | YES           | YES               |             |                   |             |
| CVE-2012-3464         | NO            | YES               |             |                   |             |
| CVE-2012-3463         | NO            | YES               |             |                   |             |
| CVE-2012-6496         | YES           | NO                |             |                   |             |
| CVE-2012-5664         | NO            | YES               |             |                   |             |
| CVE-2012-6497         | YES           | NO                |             |                   |             |
| CVE-2013-1855         | YES           | YES               |             |                   |             |
| CVE-2013-1800         | YES           | NO                |             |                   |             |
| CVE-2013-0333         | YES           | YES               |             |                   |             |
| CVE-2013-0269         | YES           | YES               |             |                   |             |
| CVE-2013-1857         | YES           | YES               |             |                   |             |
| CVE-2013-0155         | YES           | YES               |             |                   |             |
| CVE-2013-0333         | YES           | YES               |             |                   |             |
| CVE-2011-0447         | NO            | YES               |             |                   |             |
| CVE-2011-0446         | NO            | YES               |             |                   |             |
| CVE-2013-1854         | YES           | YES               |             |                   |             |
| CVE-2013-1856         | YES           | YES               |             |                   |             |
| CVE-2013-0276         | YES           | YES               |             |                   |             |
| CVE-2013-0277         | YES           | YES               |             |                   |             |
| CVE-2013-0156         | YES           | YES               |             |                   |             |
| CVE-2013-2090 [0]     | NO            | NO                |             |                   |             |
| CVE-2013-2615         | YES           | NO                |             |                   |             |
| CVE-2013-1875         | YES           | NO                |             |                   |             |

[0] This CVE must be confirmed

### Quality checks

| Quality check         | Dawn          | Brakeman          | Excellent   | ror-sec-scanner   | Scanny      |
|-----------------------|---------------|-------------------|-------------|-------------------|-------------|
| Not revised code      | YES           | NO                |             |                   |             |


### Application specific security checks

| Security check              | Dawn          | Brakeman   | Excellent   | ror-sec-scanner   | Scanny      |
|-----------------------------|---------------|------------|-------------|-------------------|-------------|
| Reflected XSS               | NO            | YES        |             |                   |             |
| Stored XSS                  | NO            | YES        |             |                   |             |
| DOM Based XSS               | NO            | NO         |             |                   |             |
| SQL injection               | NO            | YES        |             |                   |             |
| Broken authentication       | NO            | NO         |             |                   |             |
| Insecure object reference   | NO            | NO         |             |                   |             |
| CSRF                        | NO            | YES [1]    |             |                   |             |

[1] Brakeman warns if an application does not use protect_from_forgery, but it
doesn't warn about vulnerable forms (e.g. those not using view helpers) -
[@presidentbeef](https://github.com/codesake/codesake_dawn/issues/2)

## Third party reviews

If you blogged, twitted or in any case if you compare dawn with other SAST
available out there supporting ruby, please tell me and I'll add your review
here.


