require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/supplier_accounts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # SupplierAccount. As you add validations to SupplierAccount, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      SupplierAccount.create! valid_attributes
      get supplier_accounts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      supplier_account = SupplierAccount.create! valid_attributes
      get supplier_account_url(supplier_account)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_supplier_account_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      supplier_account = SupplierAccount.create! valid_attributes
      get edit_supplier_account_url(supplier_account)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SupplierAccount" do
        expect {
          post supplier_accounts_url, params: { supplier_account: valid_attributes }
        }.to change(SupplierAccount, :count).by(1)
      end

      it "redirects to the created supplier_account" do
        post supplier_accounts_url, params: { supplier_account: valid_attributes }
        expect(response).to redirect_to(supplier_account_url(SupplierAccount.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new SupplierAccount" do
        expect {
          post supplier_accounts_url, params: { supplier_account: invalid_attributes }
        }.to change(SupplierAccount, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post supplier_accounts_url, params: { supplier_account: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested supplier_account" do
        supplier_account = SupplierAccount.create! valid_attributes
        patch supplier_account_url(supplier_account), params: { supplier_account: new_attributes }
        supplier_account.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the supplier_account" do
        supplier_account = SupplierAccount.create! valid_attributes
        patch supplier_account_url(supplier_account), params: { supplier_account: new_attributes }
        supplier_account.reload
        expect(response).to redirect_to(supplier_account_url(supplier_account))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        supplier_account = SupplierAccount.create! valid_attributes
        patch supplier_account_url(supplier_account), params: { supplier_account: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested supplier_account" do
      supplier_account = SupplierAccount.create! valid_attributes
      expect {
        delete supplier_account_url(supplier_account)
      }.to change(SupplierAccount, :count).by(-1)
    end

    it "redirects to the supplier_accounts list" do
      supplier_account = SupplierAccount.create! valid_attributes
      delete supplier_account_url(supplier_account)
      expect(response).to redirect_to(supplier_accounts_url)
    end
  end
end