require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  let(:book) {
    Book.create!(
      author: nil,
      title: "MyString",
      isbn: "MyString",
      description: "MyText",
      publish_year: 1,
      price: "9.99"
    )
  }

  before(:each) do
    assign(:book, book)
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(book), "post" do

      assert_select "input[name=?]", "book[author_id]"

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[isbn]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[publish_year]"

      assert_select "input[name=?]", "book[price]"
    end
  end
end
