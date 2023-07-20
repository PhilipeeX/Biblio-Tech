require 'rails_helper'

RSpec.describe "assemblies/show", type: :view do
  before(:each) do
    assign(:assembly, Assembly.create!(
      title: "Title",
      description: "MyText",
      version: "Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Version/)
  end
end
