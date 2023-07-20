require 'rails_helper'

RSpec.describe "assemblies/index", type: :view do
  before(:each) do
    assign(:assemblies, [
      Assembly.create!(
        title: "Title",
        description: "MyText",
        version: "Version"
      ),
      Assembly.create!(
        title: "Title",
        description: "MyText",
        version: "Version"
      )
    ])
  end

  it "renders a list of assemblies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Version".to_s), count: 2
  end
end
