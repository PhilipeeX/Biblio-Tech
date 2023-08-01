Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :authors, only: [:index, :show, :create, :update, :destroy]do
      resources :books, only: [:index, :show, :create, :update, :destroy]
    end

    resources :suppliers, only: [:index, :show, :create, :update, :destroy]
  end

  resources :suppliers do
    resources :parts
    resources :accounts
  end
  resources :authors do
    resources :books
  end
  
end
