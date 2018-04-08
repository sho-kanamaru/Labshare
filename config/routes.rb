Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "workers#index"

  # workers
  resources :workers, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  resources :search, only: [:show, :index]

  # clients
  resources :clients, only: [:index, :show, :edit, :update]

  resources :recruits, only: [:new, :create, :show, :edit, :update] do
    resources :messages, param: :user_id, only: [:index, :create, :show]
    resources :approvals, only: [:update]
  end

  # put "/recruits/:id/approvals/:user_id" , to: "recruits#approval"
  get "/workers/search/results", to: "workers#search"
  get "/recruits/:recruit_id/approvals/:user_id" , to: "recruits#approval"
  get "/recruits/:recruit_id//completes/:user_id" , to: "recruits#complete"
end
