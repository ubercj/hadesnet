Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users

  resources :posts do
    resources :comments, except: "index"
    resources :likes, only: %i[ create destroy ]
  end

  resources :friendships, only: %i[ index create update destroy ]
end
