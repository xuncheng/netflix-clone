Rails.application.routes.draw do
  get "ui(/:action)", controller: "ui" if Rails.env.development?
end
