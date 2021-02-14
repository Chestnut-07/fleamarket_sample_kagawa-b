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

  resources :users, only: [:show]
  resources :credit_cards, only: [:index, :new]
  get 'api/items/categories', to: 'items#get_categories'
  resources :items, only: [:index, :new, :show, :create, :destroy] do
    collection do
    get "perchase_confirmation"
    get 'search'
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end