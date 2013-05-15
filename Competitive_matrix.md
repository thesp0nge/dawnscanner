# Competitive matrix between dawn and other security static code scanners

This is the point where I try to answer the very good question: _dawn? it is a
great tool but which are the differences between it and ( put your favorite
tool here )?_

Of course, as you may wonder, I'm the dawn author so I can be less impartial
than a third party review that it is strongly encouraged and that it will put
linked to this page (even in case you will make criticisms to my tool)

## The competitors

As the time I'm writing this (05/15/2013) the only opensource source code
security static analyzer (let's call them SAST form this point) supporting ruby
is [brakeman scanner](http://brakemanscanner.org/).

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

## The matrix

|Feature                | Dawn          | Brakeman          |
|-----------------------|---------------|-------------------|
| Version               | 0.51          | 1.9.5             |
| Production ready?     | NO            | YES               |
| Sinatra support       | YES           | NO                |
| Padrino support       | NO (planned)  | NO                |
| Rails support         | YES           | YES               |
| Plain text output     | YES           | YES               |
| Json output           | YES           | NO                |




## Third party reviews


