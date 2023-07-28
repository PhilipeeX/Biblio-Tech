Rails.application.routes.draw do
  resources :suppliers do
    resources :parts
    resources :accounts
  end
  resources :authors do
    resources :books
  end
  
end
