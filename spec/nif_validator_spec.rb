require 'spec_helper'

describe PortugueseNifValidator do
  before(:all) {
    class User < TestModel
      validates :nif, portuguese_nif: true
    end
  }

  after(:all) { Object.send(:remove_const, :User) }

  describe 'validation' do
    it 'returns true if the number is empty' do
      expect(User.new(nif: '')).to be_valid
    end

    it 'returns true if the number is not defined' do
      expect(User.new(nif: nil)).to be_valid
    end
  end
end
