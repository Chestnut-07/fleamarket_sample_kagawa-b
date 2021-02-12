Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :users, only: [:show]
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy]
  resources :items, only: [:index, :new, :show]do
    collection do
    get "perchase_confirmation/id:", to: "items#purchase_confirmation", as: "purchase_confirmation"
    post "perchase/id:", to: "items#purchase", as: "purchase"
    end
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end