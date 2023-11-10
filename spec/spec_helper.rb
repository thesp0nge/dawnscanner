require 'coveralls'
require 'dawnscanner'

def give_a_number
  require 'securerandom'
  return SecureRandom.random_number(9999)
end

RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    # Redirect stderr and stdout
    $stderr = File.new(File.join(File.dirname(__FILE__), 'dev', 'null.txt'), 'w')
    $stdout = File.new(File.join(File.dirname(__FILE__), 'dev', 'null.txt'), 'w')
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end

require 'logger'
$logger = Logger.new(STDOUT)
$logger.datetime_format = '%Y-%m-%d %H:%M:%S'
Coveralls.wear!
