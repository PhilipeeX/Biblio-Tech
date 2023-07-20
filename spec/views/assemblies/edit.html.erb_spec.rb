require 'rails_helper'

RSpec.describe "assemblies/edit", type: :view do
  let(:assembly) {
    Assembly.create!(
      title: "MyString",
      description: "MyText",
      version: "MyString"
    )
  }

  before(:each) do
    assign(:assembly, assembly)
  end

  it "renders the edit assembly form" do
    render

    assert_select "form[action=?][method=?]", assembly_path(assembly), "post" do

      assert_select "input[name=?]", "assembly[title]"

      assert_select "textarea[name=?]", "assembly[description]"

      assert_select "input[name=?]", "assembly[version]"
    end
  end
end
