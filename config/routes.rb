Rails.application.routes.draw do
  root 'users#dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :projects do
    resources :assigns
    resources :lines do
      resources :entries
    end
  end

  resources :tasks

  resources :users, only: [:edit, :update]

  get :taskboard, to: 'application#taskboard'
end
