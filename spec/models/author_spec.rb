require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'associations' do
    it { should have_many(:books) }
  end

  describe 'validations' do
    it "validates CPF correctly" do
      valid_author = Author.new(cpf: "40690699093")
      expect(valid_author).to be_valid

      invalid_author = Author.new(cpf: "11111111111")
      expect(invalid_author).to_not be_valid
    end
  end
end
