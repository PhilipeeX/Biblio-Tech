require 'rails_helper'

RSpec.describe "supplier_accounts/show", type: :view do
  before(:each) do
    assign(:supplier_account, SupplierAccount.create!(
      account: 2,
      supplier: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
