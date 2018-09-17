# frozen_string_literal: true

describe PortuguesePhoneValidator do
  class User < TestModel
    validates :phone_number, portuguese_phone: true
  end

  describe 'validation' do
    it 'returns true if the number is empty' do
      expect(User.new(phone_number: '')).to be_valid
    end

    it 'returns true if the number is not defined' do
      expect(User.new(phone_number: nil)).to be_valid
    end

    context 'given valid phone numbers' do
      %w[912345678 212345678 00351923456789 +351236123456].each do |phone_number|
        it "returns true for `#{phone_number}'" do
          expect(User.new(phone_number: phone_number)).to be_valid
        end
      end
    end

    context 'given invalid phone numbers' do
      %w[
        91234567 9123456789 0035192345678 +3519234567890 123456789 00351123456789 qwertyui -12345678
      ].each do |phone_number|
        it "returns false for `#{phone_number}'" do
          expect(User.new(phone_number: phone_number)).to be_invalid
        end
      end
    end
  end
end
