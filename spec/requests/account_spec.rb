require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  let!(:supplier) { create(:supplier) }
  let!(:account) { create(:account, supplier: supplier) }

  describe "GET /suppliers/:supplier_id/accounts" do
    it "returns a success response" do
      get supplier_accounts_path(supplier)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /suppliers/:supplier_id/accounts/:id" do
    it "returns a success response" do
      get supplier_account_path(supplier, account)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /suppliers/:supplier_id/accounts/new" do
    it "returns a success response" do
      get new_supplier_account_path(supplier)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /suppliers/:supplier_id/accounts/:id/edit" do
    it "returns a success response" do
      get edit_supplier_account_path(supplier, account)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /suppliers/:supplier_id/accounts" do
    it "creates a new account and redirects to the account page" do
      account_params = attributes_for(:account, supplier_id: supplier.id)

      post supplier_accounts_path(supplier), params: { account: account_params }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(supplier_account_url(supplier, Account.last))
      expect(flash[:notice]).to eq(I18n.t('supplier.account.controller.create'))
    end

    it 'do not create a new account with wrong digit' do
      account_params = attributes_for(:account, supplier_id: supplier.id, digit: '2')

      post supplier_accounts_path(supplier), params: { account: account_params }

      expect(response.body).to include('is invalid')
      expect(response.status).to eq(422)
    end
  end

  describe "PATCH /suppliers/:supplier_id/accounts/:id" do
    it "updates an existing account" do
      new_bank = "Credit Suisse Bank"
      patch supplier_account_path(supplier, account), params: { account: { bank: new_bank } }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(supplier_account_url(supplier, account))
      expect(flash[:notice]).to eq(I18n.t('supplier.account.controller.update'))
    end

    it "do not updates an existing account with wrong digit" do
      new_bank = "Credit Suisse Bank"
      patch supplier_account_path(supplier, account), params: { account: { bank: new_bank, number: '123456', digit: '9' } }

      expect(response.body).to include('is invalid')
      expect(response.status).to eq(422)
    end
  end

  describe "DELETE /suppliers/:supplier_id/accounts/:id" do
    it "destroys the account" do
      expect {
        delete supplier_account_path(supplier, account)
      }.to change(Account, :count).by(-1)

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(supplier_accounts_url(supplier))
      expect(flash[:notice]).to eq(I18n.t('supplier.account.controller.destroy'))
    end
  end
end