Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "posts#index"
  resources :posts, only: [:index]
  resource :profile, only: [:edit, :update, :show]
end
