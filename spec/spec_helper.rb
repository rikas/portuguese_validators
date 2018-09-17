# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'active_model'

require 'portuguese_validators'

RSpec.configure do
  include PortugueseValidators
end

class TestModel
  include ActiveModel::Validations

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end
