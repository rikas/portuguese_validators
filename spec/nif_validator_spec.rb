require 'spec_helper'

describe PortugueseNifValidator do
  before(:all) {
    class User < TestModel
      validates :nif, portuguese_nif: true
    end
  }

  after(:all) { Object.send(:remove_const, :User) }

  describe 'validation' do
    it 'returns false if the number is empty' do
      expect(User.new(nif: '')).to be_invalid
    end

    it 'returns false if the number is not defined' do
      expect(User.new(nif: nil)).to be_invalid
    end
  end
end
