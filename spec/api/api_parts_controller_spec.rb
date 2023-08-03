require 'rails_helper'

RSpec.describe Api::PartsController, type: :request do
  let!(:supplier) { create(:supplier) }
  let!(:part) { create(:part, supplier: supplier) }

  describe 'GET /api/suppliers/:supplier_id/parts' do
    it 'returns all parts for the supplier' do
      get "/api/suppliers/#{supplier.id}/parts"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET /api/suppliers/:supplier_id/parts/:id' do
    it 'returns the requested part' do
      get "/api/suppliers/#{supplier.id}/parts/#{part.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(part.id)
    end
  end

  describe 'POST /api/suppliers/:supplier_id/parts' do
    context 'with valid attributes' do
      it 'creates a new part' do
        part_params = { title: 'Capa touchscreen', description: 'Capa touchscreen funciona quase como um ipad' }
        expect {
          post "/api/suppliers/#{supplier.id}/parts", params: { part: part_params }
        }.to change(Part, :count).by(1)
      end
    end
  end

  describe 'PUT /api/suppliers/:supplier_id/parts/:id' do
    it 'updates the requested part' do
      put "/api/suppliers/#{supplier.id}/parts/#{part.id}", params: { part: { title: 'Folhas indestrutíveis, nem mesmo com fogo' } }
      part.reload
      expect(part.title).to eq('Folhas indestrutíveis, nem mesmo com fogo')
    end
  end

  describe 'DELETE /api/suppliers/:supplier_id/parts/:id' do
    it 'destroys the requested part' do
      expect {
        delete "/api/suppliers/#{supplier.id}/parts/#{part.id}"
      }.to change(Part, :count).by(-1)
    end
  end
end
