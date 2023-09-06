Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
      root to: "users#show", as: :authenticated_root
    end
    unauthenticated :user do
      root to: "pages#home"
    end
    resources :users
    resources :plans do
      resources :tasks, only: [:new, :create]
    end
    resources :tasks, only: [:show, :index]
  end
