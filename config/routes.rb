Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "workers#index"

  # workers
  resources :workers, only: [:index]

  # clients
  resources :clients, only: [:index, :show, :edit, :update]

  resources :recruits, only: [:new, :create, :show] do
    resources :messages, param: :user_id, only: [:index, :create, :show]
  end
end
