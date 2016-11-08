Rails.application.routes.draw do

  get 'jobs/index'

  get 'jobs/show'

  root 'home#index'

  devise_for :hauliers, controllers: {
        sessions: 'hauliers/sessions',
        registrations: 'hauliers/registrations'
      }

  devise_for :shippers, controllers: {
        sessions: 'shippers/sessions',
        registrations: 'shippers/registrations'
      }

  # devise_for :shippers
  # devise_for :hauliers

  resources :hauliers do
    resources :jobs
  end

  resources :shippers do
    resources :jobs
  end
end
