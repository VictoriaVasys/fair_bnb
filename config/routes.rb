Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  
  root 'home#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :reservations do
        get '/by_month', to: 'month#index'
      end
      namespace :users do
        namespace :reservations do
          get '/nights', to: 'nights#index'
          get '/bookings', to: 'bookings#index'
        end
        namespace :properties do
          get '/most_properties', to: 'most_properties#index'
        end
        namespace :money do
          get '/most_spent', to: 'most_spent#index'
          get '/most_revenue', to: 'most_revenue#index'
        end
      end
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  get '/sign_up', to: 'signup#index'
  get '/log_in', to: 'login#index'
  get  '/dashboard', to: 'dashboard#index'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :properties, only: [:index, :edit, :update]
    resources :users, only: [:index]
  end
  
  resources :conversations, only: [:create, :show, :index]
  resources :messages, only: [:create]
  resources :users, only: [:edit, :update, :show]

  resources :properties,  only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :property_availabilities, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :reservations, only: [:new]
  
  namespace :user do
    resources :properties, only: [:index]
  end

end
