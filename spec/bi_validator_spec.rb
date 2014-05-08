require 'spec_helper'

describe PortugueseBiValidator do
  before(:all) {
    class User < TestModel
      validates :bi, portuguese_bi: true
    end
  }

  after(:all) { Object.send(:remove_const, :User) }

  describe 'validation' do
    it 'returns false if the number is empty' do
      expect(User.new(bi: '')).to be_invalid
    end

    it 'returns false if the number is not defined' do
      expect(User.new(bi: nil)).to be_invalid
    end

    context 'given valid BI numbers' do
      %w(117052337 134307607 178756830 101812418).each do |bi|
        it "returns true for `#{bi}'" do
          expect(User.new(bi: bi)).to be_valid
        end
      end
    end

    context 'given blacklisted BI numbers' do
      %w(000000000).each do |bi|
        it "returns false for `#{bi}'" do
          expect(User.new(bi: bi)).to be_invalid
        end
      end
    end

    context 'given invalid BI numbers' do
      %w(-3 117051343 138473133 7873 kjas 017051349 117051348).each do |bi|
        it "returns false for `#{bi}'" do
          expect(User.new(bi: bi)).to be_invalid
        end
      end
    end
  end
end
