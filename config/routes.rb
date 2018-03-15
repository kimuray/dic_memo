Rails.application.routes.draw do
  root 'users#dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :projects do
    resources :assigns
  end
end
