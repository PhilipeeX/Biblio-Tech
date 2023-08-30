require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:author) { create(:author) }

  describe "GET /books" do
    it "returns a success response" do
      get books_path
      expect(response).to have_http_status(:success)
    end

    context 'test filter' do
      let!(:book1) { create(:book, title: 'Neuromancer', author: author) }
      let!(:book2) { create(:book, title: 'mancerneuro', author: author) }
      context 'with valid filter' do
        it 'filters and returns the correct book' do
          get books_path, params: { query: 'neuromancer' }

          expect(response.body).to include('Neuromancer')
          expect(response.body).not_to include('mancerneuro')
        end
      end

      context 'with no match filter' do
        it 'does not return any books' do
          get books_path, params: { query: 'foundation' }

          expect(response.body).not_to include('Neuromancer')
          expect(response.body).not_to include('mancerneuro')
        end
      end
    end
  end

  describe "GET /books/:id" do
    let(:book) { create(:book, author: author) }

    it "returns a success response" do
      get book_path(book)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /books" do
    it "creates a new book and redirects to the book page" do
      post books_path, params: { book: { title: "Wool" , isbn: "9780470059029", author_id: author.id } }
      expect(response).to redirect_to(book_url(Book.last))
      expect(flash[:notice]).to eq(I18n.t('author.book.controller.create'))
    end

    it "does not create a book with an invalid ISBN" do
      expect {
        post books_path, params: { book: { title: "Invalid ISBN Book", isbn: "1234567890", author_id: author.id } }
      }.to_not change(Book, :count)
    end
  end


  describe "PATCH /books/:id" do
    let(:book) { create(:book, author: author) }

    it "updates an existing book" do
      new_title = "Wool"
      patch book_path(book), params: { book: { title: new_title } }

      expect(response).to have_http_status(:found)
      expect(book.reload.title).to eq(new_title)
    end

    it 'dont update an existing book with wrong isbn' do
      book1 = create(:book, author: author)

      expect{ patch book_path(book1), params: { book: { title: 'Wrong ISBN book', isbn: '12347890'} }
      }.to_not change(Book, :count)

    end
  end

  describe "DELETE /books/:id" do
    let!(:book) { create(:book, author: author) }

    it "destroys the book" do
      expect {
        delete book_path(book)
      }.to change(Book, :count).by(-1)

      expect(response).to have_http_status(:found)
    end
  end

end
