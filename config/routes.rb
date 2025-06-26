Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  get 'mountain', to: 'mountain#index'

  root to: "posts#index"

  resources :posts do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  resource :profile, only: [:edit, :update, :show]
end
