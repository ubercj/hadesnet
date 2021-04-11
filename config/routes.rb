Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }
  
  resources :users, only: %i[ index show ] do
    resources :friendships, only: %i[ index create update destroy ]
  end

  post '/posts/:post_id/comments/:comment_id/likes', to: 'likes#comment_like_create'

  concern :likeable do
    resources :likes, only: %i[ create destroy ]
  end

  resources :posts, concerns: :likeable do
    resources :comments, except: "index", concerns: :likeable
  end
end
