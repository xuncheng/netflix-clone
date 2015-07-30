Rails.application.routes.draw do
  root to: "videos#index"

  get "ui(/:action)", controller: "ui" if Rails.env.development?
end
