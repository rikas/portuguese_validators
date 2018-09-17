# frozen_string_literal: true

module PortugueseValidators
  # Validates Portuguese BI's.
  #
  # A Portuguese BI number is comprised by eight digits. Between that number and the "issue" box,
  # the card also has a small box with a single digit. That's the control digit. In order to
  # validate a Portuguese BI you have to give the full number (including the control digit).
  class PortugueseBiValidator < ActiveModel::EachValidator
    # List of numbers that are valid but don't exist.
    BLACKLIST = ['000000000'].freeze

    def validate_each(record, attribute, value) # :nodoc:
      return if value.blank?

      record.errors.add(attribute, options[:message] || :invalid) unless valid?(value)
    end

    # Returns true if the number is a valid BI or false otherwise.
    def valid?(number)
      return false unless number

      number = number.to_s
      looks_like_bi?(number) && valid_bi?(number)
    end

    private

    def valid_bi?(number)
      control = number.split('').map(&:to_i)

      sum = 0
      9.downto(2) { |num| sum += num * control.shift }

      expected = 11 - sum % 11
      expected = 0 if expected > 9 # when the value is greater than 9 then we assume 0

      expected == control.last
    end

    def looks_like_bi?(number)
      return false if !number || BLACKLIST.include?(number)

      number.match?(/^\d{9}$/)
    end
  end
end
