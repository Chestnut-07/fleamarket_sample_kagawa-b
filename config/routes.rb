Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
    devise_scope :user do
      get 'users/index', to: 'users/registrations#index'
      get 'users/destroy', to: 'users/sessions#destroy'
  end 
  root 'items#index'

  get "mypage", to: "users#mypage"
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy]
  get 'api/items/categories', to: 'items#get_categories'
  resources :items do
    collection do
      get "purchase_confirmation/:id", to: "items#purchase_confirmation", as: "purchase_confirmation"
      post "pay/:id", to: "items#pay", as: "pay"
      get 'search'
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end