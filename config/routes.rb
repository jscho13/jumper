Rails.application.routes.draw do

  resources :venues do
    resources :reviews
  end

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

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
