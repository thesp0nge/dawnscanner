# Codesake::Dawn - code review engine for ruby powered code

Dawn is an opensource code review tool designed for applications written in
Ruby. You can use dawn to review your code for security issues either if you're
writing a web application or you're writing a command line script.

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

You can start your code review with dawn very easily. Simply tell the tool
where the project root directory is and which is the framework you used to
write the web application. 

Sorry for non autodetect this; at this point we prefere working hard over core
features like adding new vulnerabilities and having valuable output.

``` 
$ dawn _framework_ target
```

Where framework can be one of the following:

``` 
  -s for Sinatra
  -p for Padrino
  -r for Rails
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
