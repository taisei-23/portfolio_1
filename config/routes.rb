Rails.application.routes.draw do
  devise_for :users

  get "up", to: "rails/health#show", as: :rails_health_check

  resources :posts do
    collection do
      get :search
    end

    resources :comments, only: [ :create, :destroy, :edit, :update ]
  end

  resource :profile, only: [ :edit, :update, :show ]

  get "mountain", to: "mountain#search"

  get "search_routes", to: "routes#search"
  get "routes/show"

  get "train_route_sidebar", to: "train_routes#sidebar"

  get "facilities", to: "facilities#search"

  root to: "home#index"
end
