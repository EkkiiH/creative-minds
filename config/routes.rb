Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  root to: "pages#home"

  # authenticated :user do
  #   root to: "users#show"
  # end

  # unauthenticated :user do
  #   root to: "pages#home"
  # end

  resources :users
  resources :plans do
    resources :tasks, only: [:new, :create]
  end
  resources :tasks, only: [:show, :index]
end
