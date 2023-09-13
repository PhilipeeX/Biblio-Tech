Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :authors
    resources :books
    resources :accounts
    resources :parts
    resources :suppliers
    resources :assemblies
  end

  resources :parts
  resources :assemblies

  resources :authors do
    get 'relatorio', on: :collection
  end

  resources :books do
    get 'relatorio', on: :collection
  end

  resources :suppliers do
    resource :account, controller: 'accounts'
    get 'relatorio', on: :collection
  end
end
