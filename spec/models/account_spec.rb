require 'rails_helper'

RSpec.describe Account, type: :model do
  context "associations" do
    it { should belong_to(:supplier) }
  end

  context 'validations' do
    it 'should validate correct digit for account number' do
      account1 = FactoryBot.create(:account)

      expect(account1.calculate_digit_mod11).to eq('digit valid')
    end

    it 'should invalidate incorrect digit for account number' do
      account2 = FactoryBot.create(:account, digit: '4')

      expect(account2.calculate_digit_mod11).to eq('digit invalid')
    end
  end
end
