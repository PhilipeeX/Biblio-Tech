require 'rails_helper'

def json
  JSON.parse(response.body)
end

RSpec.describe Api::AccountsController, type: :request do
  before do
    @supplier = FactoryBot.create(:supplier)
    @account1 = @supplier.accounts.create(bank: "Bank1", number: "123", digit: "4")
    @account2 = @supplier.accounts.create(bank: "Bank2", number: "456", digit: "7")
  end

  describe 'GET /api/suppliers/:supplier_id/accounts' do
    before { get "/api/suppliers/#{@supplier.id}/accounts" }

    it 'returns all accounts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/suppliers/:supplier_id/accounts/:id' do
    before { get "/api/suppliers/#{@supplier.id}/accounts/#{@account1.id}" }

    it 'returns the account' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(@account1.id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/suppliers/:supplier_id/accounts' do
    context 'when the request is valid' do
      let(:supplier) { create(:supplier) }
      let(:valid_attributes) { { account: { bank: 'Inter', number: '123456', digit: '7' } } }

      it 'creates a account' do
        expect {
          post "/api/suppliers/#{supplier.id}/accounts", params: valid_attributes
        }.to change(Account, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end
  end

  describe 'PUT /api/suppliers/:supplier_id/accounts/:id' do
    let(:valid_attributes) { { account: { bank: 'Inter', number: '123456', digit: '7' } } }

    context 'when the record exists' do
      before { put "/api/suppliers/#{@supplier.id}/accounts/#{@account1.id}", params: valid_attributes }

      it 'updates the record' do
        updated_account = JSON.parse(response.body)
        expect(updated_account['bank']).to eq('Inter')
        expect(updated_account['number']).to eq('123456')
        expect(updated_account['digit']).to eq('7')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/suppliers/:supplier_id/accounts/:id' do
    before { delete "/api/suppliers/#{@supplier.id}/accounts/#{@account1.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
