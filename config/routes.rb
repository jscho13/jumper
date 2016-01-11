Rails.application.routes.draw do

  resources :venues do
    resources :reviews
    post 'upvote', to: 'votes#create_upvote'
    post 'downvote', to: 'votes#create_downvote'
  end
  devise_for :users

  root to: "venues#index"
  resources :users
end
