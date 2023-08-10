require 'rails_helper'

RSpec.describe 'Suppliers', type: :request do
  describe 'GET /suppliers' do
    it 'returns a success response' do
      get suppliers_path
      expect(response).to have_http_status(:success)
    end

    context 'test filter' do
      let!(:supplier_1) { create(:supplier, name: 'Matrix Supplier') }
      let!(:supplier_2) { create(:supplier, name: 'Other Supplier') }

      context 'with valid filter' do
        it 'filters and returns the suppliers' do
          get suppliers_path, params: { name: 'Matrix' }

          expect(response.body).to include('Matrix Supplier')
          expect(response.body).not_to include('Other Supplier')
        end
      end

      context 'with no match filter' do
        it 'shows no supplier found message' do
          get suppliers_path, params: { name: 'Nonexistent' }

          expect(response.body).to include(I18n.t('supplier.view_index.any_supplier_found'))
        end
      end
    end
  end

  describe 'POST /suppliers' do
    it 'creates a new supplier and redirects to the supplier page' do
      post suppliers_path, params: { supplier: { name: 'Supplier Inc.'} }
      expect(response).to redirect_to(supplier_url(Supplier.last))
    end

    it 'do not create a new supplier with incorrect cnpj' do
      expect {
        FactoryBot.build(:supplier, cnpj: '11111111111111')
      }.not_to change(Supplier, :count)
    end

  end

  describe 'GET /suppliers/:id' do
    let(:supplier) { FactoryBot.create(:supplier) }

    it 'returns a success response' do
      get supplier_path(supplier)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /suppliers/:id' do
    let(:supplier) { FactoryBot.create(:supplier) }

    context 'when updating with valid attributes' do
      it 'updates the supplier and redirects to the supplier page' do
        put supplier_path(supplier), params: { supplier: { name: 'Updated Supplier Inc.' } }
        expect(response).to redirect_to(supplier_url(supplier))
        supplier.reload
        expect(supplier.name).to eq('Updated Supplier Inc.')
      end
    end

    context 'when updating with an invalid CNPJ' do
      it 'does not update the supplier and re-renders the edit page' do
        original_name = supplier.name
        invalid_cnpj = '11111111111111'
        put supplier_path(supplier), params: { supplier: { cnpj: invalid_cnpj } }

        expect(response.status).to eq(422)

        supplier.reload
        expect(supplier.name).to eq(original_name)
        expect(supplier.cnpj).not_to eq(invalid_cnpj)
      end
    end
  end


  describe 'DELETE /suppliers/:id' do
    let!(:supplier) { FactoryBot.create(:supplier) }

    it 'destroys the supplier and redirects to the suppliers page' do
      expect {
        delete supplier_path(supplier)
      }.to change(Supplier, :count).by(-1)

      expect(response).to redirect_to(suppliers_url)
    end
  end
end
