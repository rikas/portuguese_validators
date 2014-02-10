module PortugueseValidators
  # Validates Portuguese bank numbers (NIB).
  #
  # The number is always composed by 21 where the last two form the control number.
  class NibValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless looks_like_nib?(value) && valid_nib?(value)
        record.errors[attribute] << (options[:message] || 'is not valid')
      end
    end

    def valid?(number)
      number = sprintf("%021o", number) if number.kind_of?(Integer)
      looks_like_nib?(number) && valid_nib?(number)
    end

    private

    def valid_nib?(number)
      nib = number.slice(0..18).split('').map { |digit| digit.to_i }
      control = number.slice(19..20).to_i

      sum = 0
      nib.each do |num|
        sum = ((sum + num) * 10) % 97
      end

      expected = 98 - ((sum * 10) % 97)
      expected == control
    end

    def looks_like_nib?(number)
      number.match(/^\d{21}$/) ? true : false
    end
  end
end