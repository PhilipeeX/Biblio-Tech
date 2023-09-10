Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :authors, only: [:index, :show, :create, :update, :destroy]do
      resources :books, only: [:index, :show, :create, :update, :destroy]
    end

    resources :suppliers, only: [:index, :show, :create, :update, :destroy]do
      resources :parts, only: [:index, :show, :create, :update, :destroy]
      resources :accounts, only: [:index, :show, :create, :update, :destroy]
    end
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
