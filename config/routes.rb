Rails.application.routes.draw do

  root to: "venues#index"

  resources :venues do
    resources :reviews
    post 'upvote', to: 'votes#create_upvote'
    post 'downvote', to: 'votes#create_downvote'
  end
  resources :users
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  get '/search' => 'search#index'
end
