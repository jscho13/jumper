Rails.application.routes.draw do

  resources :venues do
    resources :reviews
  end
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  root to: "venues#index"
  resources :users

  namespace :api do
    resources :venues do
      resources :reviews, only: [:update]
    end
  end
end
