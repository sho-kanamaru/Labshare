Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "workers#index"

  # workers
  resources :workers, only: [:index, :show]

  # clients
  resources :clients, only: [:index, :show, :edit, :update]

  resources :recruits, only: [:new, :create, :show, :edit, :update] do
    resources :messages, param: :user_id, only: [:index, :create, :show]
  end

  put "/recruits/:id/approvals/:user_id" , to: "recruits#approval"
end
