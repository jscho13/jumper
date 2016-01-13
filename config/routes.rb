Rails.application.routes.draw do

  resources :venues do
    resources :reviews
    post 'upvote', to: 'votes#create_upvote'
    post 'downvote', to: 'votes#create_downvote'
  end
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  root to: "venues#index"
  resources :users
end
