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
    resources :tasks, only: %i[new create]
    member do
      get "plan_tasks"
    end
  end
  resources :tasks, only: %i[index edit update destroy] do
    member do
      patch :toggle_complete
    end
  end
end
