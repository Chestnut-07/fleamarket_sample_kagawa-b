Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :users, only: [:show]
  resources :credit_cards, only: [:index, :new]
  get 'api/items/categories', to: 'items#get_categories'
  resources :items, only: [:index, :new, :show, :create] do
    collection do
    get "perchase_confirmation"
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end