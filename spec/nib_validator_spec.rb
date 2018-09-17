# frozen_string_literal: true

describe PortugueseNibValidator do
  class User < TestModel
    validates :nib, portuguese_nib: true
  end

  describe 'validation' do
    it 'returns true if the number is empty' do
      expect(User.new(nib: '')).to be_valid
    end

    it 'returns true if the number is not defined' do
      expect(User.new(nib: nil)).to be_valid
    end

    context 'given invalid NIB numbers' do
      %w[1 -39 three 0 823792873 004609950003132833098].each do |nib|
        it "returns false for `#{nib}'" do
          expect(User.new(nib: nib)).to be_invalid
        end
      end
    end

    context 'given valid NIB numbers' do
      %w[003509950003132833098 001800031700953102078 003600339910037234245].each do |nib|
        it "returns true for `#{nib}'" do
          expect(User.new(nib: nib)).to be_valid
        end
      end
    end
  end
end
