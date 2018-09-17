# frozen_string_literal: true

require 'active_model/validator'

require 'portuguese_validators/bi'
require 'portuguese_validators/nif'
require 'portuguese_validators/nib'
require 'portuguese_validators/phone'
require 'portuguese_validators/version'

# PortugueseValidators offer a set of Rails validators that you can use as normal ActiveRecord
# validators.
module PortugueseValidators
end

# Open ActiveModel Validations to include PortugueseValidators and avoid the manual inclusion.
module ActiveModel
  module Validations
    include PortugueseValidators
  end
end
