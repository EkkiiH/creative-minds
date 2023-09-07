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

  post "/tasks", to: "tasks#create_without_plan", as: :create_without_plan
  get "/tasks/new", to: "tasks#new_without_plan", as: :new_without_plan
  resources :tasks, only: %i[index edit update destroy]
  resources :tasks, only: %i[index edit update destroy] do
    resources :subtasks, only: %i[new create]
    member do
      patch :toggle_complete
    end
  end
  resources :subtasks, only: %i[edit update destroy] do
    member do
      patch :toggle_complete
    end
  end
end
