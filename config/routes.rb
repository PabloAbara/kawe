Rails.application.routes.draw do
  get 'checkpoint/show'
  devise_for :users
  root 'roadmap#index'
  post 'rate_resource' , to: 'checkpoint#rate_resource'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
