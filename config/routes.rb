Rails.application.routes.draw do
  root "workers#index"

  # workers
  resources :workers, only: [:index]

  # clients
  resources :clients, only: [:index]

  resources :recruits, only: [:new, :show] do
    resources :messages, only: [:index]
  end
end
