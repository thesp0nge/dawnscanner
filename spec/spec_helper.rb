require 'coveralls'

require 'codesake_commons'
$logger  = Codesake::Commons::Logging.instance

require 'codesake-dawn'
Coveralls.wear!
