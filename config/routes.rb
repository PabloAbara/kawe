# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "roadmaps#show"

  resources :roadmaps, only: %i[index show] do
    resources :checkpoints, only: [:show] do
      member do
        post "rate_resource"
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
