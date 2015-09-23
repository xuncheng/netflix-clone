Rails.application.routes.draw do
  root to: "videos#index"
  get "home", to: "videos#index"

  resources :videos, only: :show do
    post :search, on: :collection
  end
  resources :categories, only: :show

  get "ui(/:action)", controller: "ui" if Rails.env.development?
end
