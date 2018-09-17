# frozen_string_literal: true

module PortugueseValidators
  # Validates Portuguese Phone numbers.
  #
  # The portuguese phone numbers can start by 00351 or +351 and are composed by 9 digits.
  # The number must start with one of the values in VALID_PREFIXES
  class PortuguesePhoneValidator < ActiveModel::EachValidator
    VALID_PREFIXES = %w[
      91 92 93 96 21 226 231 232 233 234 235 236 238 239 241 242 243 244 245 249 251 252 253 254 255
      256 258 259 261 262 263 265 266 268 269 271 272 273 274 275 276 277 278 279 281 281 282 283
      284 285 286 289 291 292 295 296
    ].freeze

    COUNTRY_PREFIXES = %w[00351 +351].freeze

    def validate_each(record, attribute, value)
      return if value.blank?

      phone_number = value.to_s.delete(' ')
      record.errors.add(attribute, options[:message] || :invalid) unless valid?(phone_number)
    end

    def valid?(number)
      looks_like_phone_number?(number.to_s) && valid_phone_number?(number.to_s)
    end

    private

    def valid_phone_number?(number)
      COUNTRY_PREFIXES.each { |pref| number.gsub!(pref, '') if number.start_with?(pref) }
      VALID_PREFIXES.each { |pref| return true if number.start_with?(pref) }

      false
    end

    def looks_like_phone_number?(number)
      number.match?(/^((00|\+)(\d{3}))?\d{9}$/)
    end
  end
end
