require 'coveralls'
require 'dawnscanner'
require 'codesake-commons'

def give_a_number
  require 'securerandom'
  return SecureRandom.random_number(9999)
end

$logger  = Codesake::Commons::Logging.instance
Coveralls.wear!
