Rails.application.routes.draw do
  resources :assemblies
  resources :parts
  resources :supplier_accounts
  resources :suppliers
  resources :books
  resources :authors

  resources :suppliers do
    resources :parts, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
