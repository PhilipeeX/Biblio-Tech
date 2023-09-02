require 'rails_helper'

RSpec.describe 'Assemblies', type: :request do
  let(:part) { FactoryBot.create(:part) }

  describe 'GET /assemblies' do
    it 'returns a success response' do
      get assemblies_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /assemblies' do
    it 'creates a new assembly and redirects to the assembly page' do
      post assemblies_path, params: { assembly: { name: 'Capa rígida', part_ids: [part.id] } }
      expect(response).to redirect_to(assembly_url(Assembly.last))
    end
  end

  describe 'GET /assemblies/:id' do
    it 'returns a success response' do
      assembly = FactoryBot.create(:assembly)
      get assembly_path(assembly)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /assemblies/:id/edit' do
    it 'returns a success response' do
      assembly = FactoryBot.create(:assembly)
      get edit_assembly_path(assembly)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /assemblies/:id' do
    it 'updates the assembly and redirects to the assembly page' do
      assembly = FactoryBot.create(:assembly, name: 'Livro de bolso')
      patch assembly_path(assembly), params: { assembly: { name: 'Livro em braile' } }
      expect(response).to redirect_to(assembly_url(assembly))
      assembly.reload
      expect(assembly.name).to eq('Livro em braile')
    end
  end

  describe 'DELETE /assemblies/:id' do
    it 'destroys the assembly and redirects to the assemblies page' do
      assembly = FactoryBot.create(:assembly)
      delete assembly_path(assembly)
      expect(response).to redirect_to(assemblies_url)
      expect(Assembly.exists?(assembly.id)).to be_falsey
    end
  end
end
