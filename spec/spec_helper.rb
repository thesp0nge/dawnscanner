require 'coveralls'
require 'dawnscanner'

def give_a_number
  require 'securerandom'
  return SecureRandom.random_number(9999)
end

require 'logger'
$logger = Logger.new(STDOUT)
$logger.datetime_format = '%Y-%m-%d %H:%M:%S'
Coveralls.wear!
