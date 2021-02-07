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
  resource :items, only: [:index, :new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
