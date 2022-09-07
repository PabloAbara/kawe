# == Route Map
#

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root "roadmaps#show"

  resources :roadmaps, only: %i[index show] do
    post "complete_checkpoint"
    delete "uncomplete_checkpoint"
    post "create_checkpoint"
    resources :checkpoints, only: [:show] do
      member do
        post "create_resource"
        post "rate_resource"
        delete "delete_resource"
      end
    end
  end
end
