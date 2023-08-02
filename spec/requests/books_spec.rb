# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe "Books", type: :request do
  let!(:author) { create(:author) }

  describe "GET /authors/:author_id/books" do
    it "returns a success response" do
      get author_books_path(author)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /authors/:author_id/books/:id" do
    let(:book) { create(:book, author: author) }

    it "returns a success response" do
      get author_book_path(author, book)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /authors/:author_id/books" do
    it "creates a new book and redirects to the book page" do

      post author_books_path(author), params: { book: { title: "Wool"}}
      expect(response).to redirect_to(author_book_url(author, author.books.last))
      expect(flash[:notice]).to eq(I18n.t('author.book.controller.create'))
    end
  end


  describe "PATCH /authors/:author_id/books/:id" do
    let(:book) { create(:book, author: author) }

    it "updates an existing book" do
      new_title = "Wool"
      patch author_book_path(author, book), params: { book: { title: new_title } }

      expect(response).to have_http_status(:found)
      expect(book.reload.title).to eq(new_title)
    end
  end

  describe "DELETE /authors/:author_id/books/:id" do
    let(:author) { create(:author) }
    let!(:book) { create(:book, author: author) }

    it "destroys the book" do
      expect {
        delete author_book_path(author, book)
        author.reload
      }.to change(author.books, :count).by(-1)

      expect(response).to have_http_status(:found)
    end
  end

end
