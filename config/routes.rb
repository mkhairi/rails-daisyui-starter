Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :pages
  get '/static/:page' => 'pages#static', as: :static_page
  root 'pages#welcome'
end
