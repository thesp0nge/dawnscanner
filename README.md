# Codesake::Dawn - code review engine for ruby powered code

This is an ongoing roadmap for the dawn source code review tool.

Dawn is a static analysis security scanner for ruby written web applications.
It supports [Sinatra](http://www.sinatrarb.com),
[Padrino](http://www.padrinorb.com) and [Ruby on Rails](http://rubyonrails.org)
frameworks. 

## Installation

Add this line to your application's Gemfile:

    gem 'codesake-dawn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codesake-dawn

## Usage

You can start your code review with dawn very easily. Simply tell the tool
where the project root directory is and which is the framework you used to
write the web application. 

_Sorry for non autodetect this; at this point we prefere working hard over core
features like adding new vulnerabilities and having valuable output._

dawn command line is in this form with options and the target.
``` 
$ dawn [options] target
```



You can also dump all security checks in the knowledge base by using the -k
flag:

```
$ dawn -k|--list-knowledge-base 
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
