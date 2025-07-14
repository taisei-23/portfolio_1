Rails.application.routes.draw do
  get "train_route_sidebar", to: "train_routes#sidebar"
  get "routes/show"
  resources :posts
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  get 'mountain', to: 'mountain#index'
  get "search_routes", to: "routes#search"


  root to: "posts#index"

  resources :posts do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  resource :profile, only: [:edit, :update, :show]
end
