Rails.application.routes.draw do
  devise_for :users
  root "roadmaps#show"

  resources :roadmaps, only: %i[index show] do
    post "complete_checkpoint"
    delete "uncomplete_checkpoint"
    resources :checkpoints, only: [:show] do
      member do
        post "create_resource"
        post "rate_resource"
      end
    end
  end
end
