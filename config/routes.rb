Rails.application.routes.draw do
  root 'users#dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :projects do
    resources :assigns
  end

  resources :users, only: [:edit, :update]
end
