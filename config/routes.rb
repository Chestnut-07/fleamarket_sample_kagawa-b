Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: [:show]
  resources :credit_cards, only: [:index, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
