Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :workspaces do
      resources :bookings, only: [:create, :destroy]
  end

  # resources :bookings, except: [:index, :show, :create, :edit, :destroy, :update, :new ]do
    # get "my_bookings", on: :collection
  # end
end
