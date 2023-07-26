Rails.application.routes.draw do
  resources :parts
  resources :accounts
  resources :suppliers

  resources :authors do
    resources :books
  end
  
end
