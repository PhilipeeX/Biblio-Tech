require 'rails_helper'

RSpec.describe PartsController, type: :controller do
  let(:supplier) { create(:supplier) }

  describe "GET #show" do
    let(:part) { create(:part, supplier: supplier) }

    it "returns a success response" do
      get :show, params: { supplier_id: supplier.id, id: part.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { supplier_id: supplier.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new part and redirects to the part page" do
      part_params = attributes_for(:part)
      expect {
        post :create, params: { supplier_id: supplier.id, part: part_params }
      }.to change(Part, :count).by(1)
      expect(response).to redirect_to(supplier_part_url(supplier, Part.last))
    end
  end

  describe "GET #edit" do
    let(:part) { create(:part, supplier: supplier) }

    it "returns a success response" do
      get :edit, params: { supplier_id: supplier.id, id: part.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    let(:part) { create(:part, supplier: supplier) }

    it "updates an existing part and redirects to the part page" do
      new_title = "Capa de livro dourada"
      patch :update, params: { supplier_id: supplier.id, id: part.id, part: { title: new_title } }
      expect(response).to have_http_status(:found)
      expect(part.reload.title).to eq(new_title)
    end
  end

  describe "DELETE #destroy" do
    let!(:part) { create(:part, supplier: supplier) }

    it "destroys the part and redirects to the parts index page" do
      expect {
        delete :destroy, params: { supplier_id: supplier.id, id: part.id }
      }.to change(Part, :count).by(-1)
      expect(response).to redirect_to(supplier_parts_url(supplier))
    end
  end
end
