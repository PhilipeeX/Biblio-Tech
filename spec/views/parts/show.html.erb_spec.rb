require 'rails_helper'

RSpec.describe "parts/show", type: :view do
  before(:each) do
    assign(:part, Part.create!(
      name: "Name",
      supplier: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
