Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "pages/*id", to: "pages#show", as: :page, format: false

  root "pages#index"
end
