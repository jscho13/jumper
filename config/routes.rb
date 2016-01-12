Rails.application.routes.draw do

  resources :venues do
    resources :reviews
  end
  devise_for :users

  root to: "venues#index"
  resources :users

  namespace :api do
    resources :venues do
      resources :reviews, only: [:update]
    end
  end
end
