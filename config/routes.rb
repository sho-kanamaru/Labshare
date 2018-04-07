Rails.application.routes.draw do
  devise_for :users

  get 'workers/index'

  root "workers#index"

  # workers
  resources :workers, only: [:index]

  # clients
  resources :clients, only: [:index]

  resources :recruits, only: [:new, :create, :show] do
    resources :messages, only: [:index]
  end
end
