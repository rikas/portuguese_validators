module PortugueseValidators
  # Validates Portuguese NIF's.
  #
  # The portuguese NIF is composed by 9 digits and it must start with 1, 2, 5, 6, 7, 8 or 9. The
  # last digit is the control digit.
  class PhoneValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless is_valid?(value)
        record.errors[attribute] << (options[:message] || 'is not a valid NIF')
      end
    end

    def is_valid?(number)
      nif = number.to_s
      looks_like_nif?(nif) && valid_phone?(nif)
    end

    private

    def valid_phone?(number)
    end

    def looks_like_nif?(number)
      return false unless number
      number.match(/^\d{9}$/) && number.match(/^[1256789]/) ? true : false
    end
  end
end