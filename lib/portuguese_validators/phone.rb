module PortugueseValidators
  # Validates Portuguese Phone numbers.
  #
  # The portuguese NIF is composed by 9 digits and it must start with 1, 2, 5, 6, 7, 8 or 9. The
  # last digit is the control digit.
  class PortuguesePhoneValidator < ActiveModel::EachValidator
    VALID_PREFIXES = %w(91 92 93 96 21 226 231 232 233 234 235 236 238 239 241 242 243 244 245 249
      251 252 253 254 255 256 258 259 261 262 263 265 266 268 269 271 272 273 274 275 276 277 278
      279 281 281 282 283 284 285 286 289 291 292 295 296)

    COUNTRY_PREFIXES = %w(00351 +351)

    def validate_each(record, attribute, value)
      return if value.blank?
      number = value.gsub(" ", "")
      unless is_valid?(number)
        record.errors[attribute] << (options[:message] || 'is not a valid phone number')
      end
    end

    def is_valid?(number)
      looks_like_phone_number?(number.to_s) && valid_phone_number?(number.to_s)
    end

    private

    def valid_phone_number?(number)
      COUNTRY_PREFIXES.each { |pref| number.gsub!(pref, '') if number.start_with?(pref) }
      VALID_PREFIXES.each { |pref| return true if number.start_with?(pref) }
      false
    end

    def looks_like_phone_number?(number)
      number.match(/^((00|\+)(\d{3}))?\d{9}$/) ? true : false
    end
  end

end
