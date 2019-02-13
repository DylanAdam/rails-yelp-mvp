Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show, :edit, :new, :create]

  namespace :admin do
    resources :restaurants, only: [:index, :update, :destroy]
    resources :reviews, only: [:index, :update, :destroy]
  end
  root to: 'controller#action'
end