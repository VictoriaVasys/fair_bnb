Rails.application.routes.draw do
  root 'home#index'

  devise_for :users,
    :controllers => {
      omniauth_callbacks: "users/omniauth_callbacks",
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  get '/sign_up', to: 'signup#index'
  get '/log_in', to: 'login#index'
  get  '/dashboard', to: 'dashboard#index'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :properties, only: [:index, :edit, :update]
    resources :users, only: [:index]
  end

  resources :users, only: [:edit, :update, :show]

  resources :properties,  only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :reservations, only: [:new]

  namespace :user do
    resources :properties, only: [:index]
    resources :reservations, only: [:new, :create, :index, :show]
  end
end
