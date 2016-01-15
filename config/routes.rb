Rails.application.routes.draw do

  root to: "homes#index"
  get '/search' => 'search#index'

  devise_for :users

  as :user do
    get 'users', :to => 'venues#index', :as => :user_root
  end

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
