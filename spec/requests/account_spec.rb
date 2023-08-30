require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  let!(:supplier) { create(:supplier) }
  let!(:account) { create(:account, supplier: supplier) }

  describe "GET /suppliers/:supplier_id/accounts" do
    it "returns a success response" do
      get supplier_account_url(supplier)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /suppliers/:supplier_id/accounts/new" do
    it "returns a success response" do
      get new_supplier_account_path(supplier)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /suppliers/:supplier_id/accounts/edit" do
    it "returns a success response" do
      get edit_supplier_account_path(supplier)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /suppliers/:supplier_id/accounts" do
    context "with valid parameters" do
      before { supplier.account.destroy }

      it "creates a new accounts and redirects to the supplier page" do
        account_params = attributes_for(:account).merge(supplier_id: supplier.id)

        expect {
          post supplier_account_path(supplier), params: { account: account_params }
        }.to change(Account, :count).by(1)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(supplier_account_path(supplier))
        expect(flash[:notice]).to eq(I18n.t('supplier.account.controller.create'))
      end
    end

    context "with invalid parameters" do
      before { supplier.account.destroy }

      it 'does not create a new accounts with wrong digit' do
        account_params = attributes_for(:account, digit: '2')

        post supplier_account_path(supplier), params: { account: account_params }

        expect(response.body).to include('is invalid')
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /suppliers/:supplier_id/accounts" do
    context "with valid parameters" do
      it "updates an existing account" do
        new_bank = "Credit Suisse Bank"
        patch supplier_account_path(supplier), params: { account: { bank: new_bank } }

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(supplier_account_url(supplier))
        expect(flash[:notice]).to eq(I18n.t('supplier.account.controller.update'))
      end
    end


    context "with invalid parameters" do
      it "does not update an existing accounts with wrong digit" do
        new_bank = "Credit Suisse Bank"
        patch supplier_account_path(supplier), params: { account: { bank: new_bank, number: '123456', digit: '9' } }

        expect(response.body).to include('is invalid')
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /suppliers/:supplier_id/accounts" do
    it "destroys the accounts" do
      expect {
        delete supplier_account_path(supplier)
      }.to change(Account, :count).by(-1)

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(supplier_url(supplier))
      expect(flash[:notice]).to eq(I18n.t('supplier.account.controller.destroy'))
    end
  end
end
