require 'rails_helper'

RSpec.describe "supplier_accounts/new", type: :view do
  before(:each) do
    assign(:supplier_account, SupplierAccount.new(
      account: 1,
      supplier: nil
    ))
  end

  it "renders new supplier_account form" do
    render

    assert_select "form[action=?][method=?]", supplier_accounts_path, "post" do

      assert_select "input[name=?]", "supplier_account[account]"

      assert_select "input[name=?]", "supplier_account[supplier_id]"
    end
  end
end
