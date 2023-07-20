require 'rails_helper'

RSpec.describe "assemblies/new", type: :view do
  before(:each) do
    assign(:assembly, Assembly.new(
      title: "MyString",
      description: "MyText",
      version: "MyString"
    ))
  end

  it "renders new assembly form" do
    render

    assert_select "form[action=?][method=?]", assemblies_path, "post" do

      assert_select "input[name=?]", "assembly[title]"

      assert_select "textarea[name=?]", "assembly[description]"

      assert_select "input[name=?]", "assembly[version]"
    end
  end
end
