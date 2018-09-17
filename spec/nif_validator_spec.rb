# frozen_string_literal: true

describe PortugueseNifValidator do
  class User < TestModel
    validates :nif, portuguese_nif: true
  end

  describe 'validation' do
    it 'returns true if the number is empty' do
      expect(User.new(nif: '')).to be_valid
    end

    it 'returns true if the number is not defined' do
      expect(User.new(nif: nil)).to be_valid
    end
  end
end
