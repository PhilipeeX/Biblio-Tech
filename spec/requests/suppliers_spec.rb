require 'rails_helper'

RSpec.describe "Suppliers", type: :request do
  describe "GET /suppliers" do
    it "returns a success response" do
      get suppliers_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /suppliers" do
    it "creates a new supplier and redirects to the supplier page" do
      post suppliers_path, params: { supplier: { name: "Supplier Inc.", cnpj: "12345678901234" } }
      expect(response).to redirect_to(supplier_url(Supplier.last))
    end

  end

  describe "GET /suppliers/:id" do
    let(:supplier) { FactoryBot.create(:supplier) }

    it "returns a success response" do
      get supplier_path(supplier)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /suppliers/:id" do
    let(:supplier) { FactoryBot.create(:supplier) }

    it "updates the supplier and redirects to the supplier page" do
      put supplier_path(supplier), params: { supplier: { name: "Updated Supplier Inc." } }
      expect(response).to redirect_to(supplier_url(supplier))
      supplier.reload
      expect(supplier.name).to eq("Updated Supplier Inc.")
    end

    it "does not update the supplier with invalid attributes" do
      put supplier_path(supplier), params: { supplier: { name: "" } }
      expect(response).to have_http_status(:unprocessable_entity)
      supplier.reload
      expect(supplier.name).not_to eq("")
    end
  end

  describe "DELETE /suppliers/:id" do
    let!(:supplier) { FactoryBot.create(:supplier) }

    it "destroys the supplier and redirects to the suppliers page" do
      expect {
        delete supplier_path(supplier)
      }.to change(Supplier, :count).by(-1)

      expect(response).to redirect_to(suppliers_url)
    end
  end
end
