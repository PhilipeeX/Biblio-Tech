require 'rails_helper'

RSpec.describe Book, type: :model do
  context "associations" do
    it { should belong_to(:author) }
  end

  describe "ISBN validation" do
    it "validates a correct ISBN-10" do
      book = FactoryBot.build(:book, isbn: "0471958697")
      expect(book).to be_valid
    end

    it "validates a correct ISBN-13" do
      book = FactoryBot.build(:book, isbn: "9780470059029")
      expect(book).to be_valid
    end

    it "rejects an incorrect ISBN" do
      book = FactoryBot.build(:book, isbn: "1234567890")
      expect(book).not_to be_valid
      expect(book.errors[:isbn]).to include("is not valid")
    end
  end
end
