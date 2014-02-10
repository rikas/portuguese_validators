module PortugueseValidators
  # Validates Portuguese BI's.
  #
  # A Portuguese BI number is comprised by eight digits. Between that number and the "issue" box,
  # the card also has a small box with a single digit. That's the control digit. In order to
  # validate a Portuguese BI you have to give the full number (including the control digit).
  class BiValidator
    def validate_each(record, attribute, value)
      unless valid?(value)
        record.errors[attribute] << (options[:message] || 'is not valid')
      end
    end

    def valid?(number)
      looks_like_bi?(number.to_s) && valid_bi?(number.to_s)
    end

    private

    def valid_bi?(number)
      control = number.split('').map { |digit| digit.to_i }

      sum = 0
      9.downto(2) do |num|
        sum += num * control.shift
      end

      expected = 11 - sum % 11;
      expected = 0 if expected > 9 # when the value is greater than 9 then we assume 0

      expected == control.last
    end

    def looks_like_bi?(number)
      number.match(/^\d{9}$/) ? true : false
    end
  end
end