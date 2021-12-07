# frozen_string_literal: true

module PortugueseValidators
  # Validates Portuguese bank numbers (NIB).
  #
  # The number is always composed by 21 where the last two form the control number.
  class PortugueseNibValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.blank?

      record.errors.add(attribute, options[:message] || :invalid) unless valid?(value)
    end

    def valid?(number)
      return false unless number

      number = format('%<foo>021o', number) if number.is_a?(Integer)
      looks_like_nib?(number) && valid_nib?(number)
    end

    private

    def valid_nib?(number)
      nib = number.slice(0..18).split('').map(&:to_i)
      control = number.slice(19..20).to_i

      sum = 0
      nib.each do |num|
        sum = ((sum + num) * 10) % 97
      end

      expected = 98 - ((sum * 10) % 97)
      expected == control
    end

    def looks_like_nib?(number)
      return false unless number

      number =~ /^\d{21}$/
    end
  end
end
