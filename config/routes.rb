Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users
  resources :users, only: %i[ index show ] do
    resources :friendships, only: %i[ index create update destroy ]
  end

  resources :posts do
    resources :comments, except: "index"
    resources :likes, only: %i[ create destroy ]
  end

  
end
