Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:show, :edit, :update, :destroy]

  resources :workspaces do
    resources :bookings, only: [:create]
        # get "my_bookings", on: :collection
  end

  resources :bookings, except: [:index, :show, :create, :edit, :destroy, :update, :new ]do
    get "my_bookings", on: :collection
  resources :workspaces do
      resources :bookings, only: [:create, :destroy]
  end
end
