require 'spec_helper'

describe BiValidator do
  describe '#is_valid?' do
    let(:validator) { BiValidator.new }

    it 'returns true for valid BI numbers' do
      %w(117052337 134307607 178756830 101812418).each do |bi|
        expect(validator.is_valid?(bi)).to be_true
      end
    end

    it 'returns false for blacklisted BI numbers' do
      %w(000000000).each do |bi|
        expect(validator.is_valid?(bi)).to be_false
      end
    end

    it 'returns false for invalid BI numbers' do
      %w(117051343 138473133 7873 kjas 017051349 117051348).each do |bi|
        expect(validator.is_valid?(bi)).to be_false
      end
    end
  end
end