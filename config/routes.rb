Rails.application.routes.draw do
  get 'checkpoint/show'
  devise_for :users
  root 'roadmap#index'
  patch 'resource' , to: 'checkpoint#resource'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
