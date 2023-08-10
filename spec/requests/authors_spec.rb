# spec/requests/authors_spec.rb
require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'GET /authors' do
    it 'returns a success response' do
      get authors_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /authors' do
    it 'creates a new author and redirects to the author page' do
      post authors_path, params: { author: { name: 'John Doe', cpf: FFaker::IdentificationBR.cpf } }
      expect(response).to redirect_to(author_url(Author.last))
    end

    it 'do not create a new author with wrong cpf' do
      expect {
        post authors_path, params: { author: { name: 'John Doe', cpf: '1111111111111' } }
      }.to_not change(Author, :count)
    end

  end

  describe 'GET /authors/:id' do
    it 'returns a success response' do
      author = FactoryBot.create(:author)
      get author_path(author)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /authors/:id/edit' do
    it 'returns a success response' do
      author = FactoryBot.create(:author)
      get edit_author_path(author)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /authors/:id' do
    it 'updates the author and redirects to the author page' do
      author = FactoryBot.create(:author, name: 'Old name')
      patch author_path(author), params: { author: { name: 'New Name' } }
      expect(response).to redirect_to(author_url(author))
      author.reload
      expect(author.name).to eq('New Name')
    end

    it 'do not update the author with invalid cpf' do
      asimov = FactoryBot.create(:author, cpf: '45034615088')
      patch author_path(asimov), params: { author: { cpf: '11111111111' } }
      expect(response).to have_http_status(422)
      asimov.reload
      expect(asimov.cpf).to eq('45034615088')
    end
  end

  describe 'DELETE /authors/:id' do
    it 'destroys the author and redirects to the authors page' do
      author = FactoryBot.create(:author)
      delete author_path(author)
      expect(response).to redirect_to(authors_url)
      expect(Author.exists?(author.id)).to be_falsey
    end
  end
end
