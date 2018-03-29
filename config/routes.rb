Rails.application.routes.draw do
  root 'users#dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :projects do
    resources :assigns
    resources :lines do
      resources :entries
      resources :tasks
    end
  end
end
