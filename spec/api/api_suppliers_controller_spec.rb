require 'rails_helper'

RSpec.describe Api::SuppliersController, type: :request do
  let!(:supplier) { create(:supplier) }

  describe 'GET /api/suppliers' do
    it 'returns all suppliers' do
      get '/api/suppliers'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET /api/suppliers/:id' do
    it 'returns the requested supplier' do
      get "/api/suppliers/#{supplier.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(supplier.id)
    end
  end

  describe 'POST /api/suppliers' do
    it 'creates a new supplier' do
      supplier_params = { name: 'PageMakers Inc.', cnpj: '12345678000199' }
      expect {
        post '/api/suppliers', params: { supplier: supplier_params }
      }.to change(Supplier, :count).by(1)
    end
  end

  describe 'PUT /api/suppliers/:id' do
    it 'updates the requested supplier' do
      put "/api/suppliers/#{supplier.id}", params: { supplier: { name: 'PageMakers Inc.', cnpj: '99999999000188' } }
      supplier.reload
      expect(supplier.name).to eq('PageMakers Inc.')
      expect(supplier.cnpj).to eq('99999999000188')
    end
  end

  describe 'DELETE /api/suppliers/:id' do
    it 'destroys the requested supplier' do
      expect {
        delete "/api/suppliers/#{supplier.id}"
      }.to change(Supplier, :count).by(-1)
    end
  end
end
