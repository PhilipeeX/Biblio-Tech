require 'rails_helper'

RSpec.describe "supplier_accounts/edit", type: :view do
  let(:supplier_account) {
    SupplierAccount.create!(
      account: 1,
      supplier: nil
    )
  }

  before(:each) do
    assign(:supplier_account, supplier_account)
  end

  it "renders the edit supplier_account form" do
    render

    assert_select "form[action=?][method=?]", supplier_account_path(supplier_account), "post" do

      assert_select "input[name=?]", "supplier_account[account]"

      assert_select "input[name=?]", "supplier_account[supplier_id]"
    end
  end
end
