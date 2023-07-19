require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      author: nil,
      title: "MyString",
      isbn: "MyString",
      description: "MyText",
      publish_year: 1,
      price: "9.99"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[author_id]"

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[isbn]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[publish_year]"

      assert_select "input[name=?]", "book[price]"
    end
  end
end
