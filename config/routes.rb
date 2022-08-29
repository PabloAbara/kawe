Rails.application.routes.draw do
  get 'checkpoint/show'
  devise_for :users
  root 'roadmap#show'

  resources :roadmaps, only: [:index, :show] do
    resources :checkpoints, only: [:show] do
      post 'rate_resource'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
