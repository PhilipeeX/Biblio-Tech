require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe 'associations' do
    it { should have_many(:accounts) }
    it { should have_many(:parts) }
  end

  describe 'validations' do
    context 'when CNPJ is valid' do
      it 'is valid' do
        supplier = FactoryBot.build(:supplier)
        expect(supplier).to be_valid
      end
    end

    context 'when CNPJ is invalid' do
      it 'is not valid' do
        supplier = FactoryBot.build(:supplier, cnpj: '12345678901234')
        expect(supplier).not_to be_valid
        expect(supplier.errors[:cnpj]).to include("não é válido") # TODO: Usar o I18n aqui
      end
    end
  end

end
