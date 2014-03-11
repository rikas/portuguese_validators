require 'rubygems'
require 'bundler/setup'

require 'portuguese_validators'

RSpec.configure do |config|
  include PortugueseValidators
end