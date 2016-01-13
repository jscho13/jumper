Rails.application.routes.draw do

  root to: "venues#index"
  get '/search' => 'search#index'

  devise_for :users
  resources :users
  resources :venues do
    resources :reviews
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  namespace :api do
    resources :venues do
      resources :reviews, only: [:update]
    end
  end
end
