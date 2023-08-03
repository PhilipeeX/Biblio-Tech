require 'rails_helper'

RSpec.describe Api::AuthorsController, type: :controller do
  let!(:author) { create(:author) }

  describe 'GET #index' do
    it 'returns all authors' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns the requested author' do
      get :show, params: { id: author.id }, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(author.id)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new author' do
        expect {
          post :create, params: { author: { name: 'John Doe', cpf: '12345678901' } }, format: :json
        }.to change(Author, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the requested author' do
        put :update, params: { id: author.id, author: { name: 'Hugh Howey' } }, format: :json
        author.reload
        expect(author.name).to eq('Hugh Howey')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested author' do
      expect {
        delete :destroy, params: { id: author.id }, format: :json
      }.to change(Author, :count).by(-1)
    end
  end
end
