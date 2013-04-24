# Codesake::Dawn - code review engine for ruby powered code

Dawn is an opensource code review tool designed for applications written in
Ruby. Dawn, as code review as well, can be applied both to web application than
to any ruby written command line script.

Dawn is able to detect web applications written using Sinatra, Padrino and
Rails frameworks.

## Installation

Add this line to your application's Gemfile:

    gem 'codesake_dawn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codesake_dawn

## Usage

Basic Dawn usage is:
``` 
$ dawn _framework-flag_ target
```

Where
``` 
  target is the directory containing the web application
  framework-flag can be one of the following:
    -s if the application is written in Sinatra
    -p if the application is written in Padrino
    -r if the application is written in Rails
``` 

You can list all the security check in the knowledge base by using the -k flag:
```
$ dawn -k|--list-knowledge-base 
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
