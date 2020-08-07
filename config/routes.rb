Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :workspaces do
    collection do
      get :my_workspaces
    end
  end

  resources :workspaces do
      resources :bookings, only: [:create]
  end



  # resources :bookings, only: [:index]

  resources :bookings, only: [:destroy] do
    member do
      get :validation
      get :rejection
    end

    collection do
      get :my_bookings
    end
  end

end
