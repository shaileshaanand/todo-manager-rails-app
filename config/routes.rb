Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index", as: "root"
  resources :todos
  resources :users
  post "users/login", to: "users#login"
end
