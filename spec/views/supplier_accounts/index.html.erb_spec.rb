require 'rails_helper'

RSpec.describe "supplier_accounts/index", type: :view do
  before(:each) do
    assign(:supplier_accounts, [
      SupplierAccount.create!(
        account: 2,
        supplier: nil
      ),
      SupplierAccount.create!(
        account: 2,
        supplier: nil
      )
    ])
  end

  it "renders a list of supplier_accounts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
