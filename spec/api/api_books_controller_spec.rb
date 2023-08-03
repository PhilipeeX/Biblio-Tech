require 'rails_helper'

RSpec.describe Api::BooksController, type: :request do
  let!(:author) { create(:author) }
  let!(:book) { create(:book, author: author) }

  describe 'GET /api/authors/:author_id/books' do
    it 'returns all books for the author' do
      get "/api/authors/#{author.id}/books"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET /api/authors/:author_id/books/:id' do
    it 'returns the requested book' do
      get "/api/authors/#{author.id}/books/#{book.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(book.id)
    end
  end

  describe 'POST /api/authors/:author_id/books' do
    context 'with valid attributes' do
      it 'creates a new book' do
        book_params = { title: 'New Book', author_id: author.id }
        expect {
          post "/api/authors/#{author.id}/books", params: { book: book_params }
        }.to change(Book, :count).by(1)
      end
    end
  end

  describe 'PUT /api/authors/:author_id/books/:id' do
    it 'updates the requested book' do
      put "/api/authors/#{author.id}/books/#{book.id}", params: { book: { title: 'Wool' } }
      book.reload
      expect(book.title).to eq('Wool')
    end
  end

  describe 'DELETE /api/authors/:author_id/books/:id' do
    it 'destroys the requested book' do
      expect {
        delete "/api/authors/#{author.id}/books/#{book.id}"
      }.to change(Book, :count).by(-1)
    end
  end
end
