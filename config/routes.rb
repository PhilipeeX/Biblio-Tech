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

  scope :relatorios do
    get 'author', to: 'authors#relatorio'
    get 'book', to: 'books#relatorio'
  end

  resources :authors
  resources :books
  resources :parts
  resources :assemblies

  resources :suppliers do
    resource :account, controller: 'accounts'
  end
end
