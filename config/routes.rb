Rails.application.routes.draw do

  root 'home#index'

  # devise_for :hauliers, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  # devise_for :shippers, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  # devise_for :employees, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}


  devise_for :hauliers, controllers: {
        sessions: 'hauliers/sessions',
        registrations: 'hauliers/registrations'
      }

  devise_for :shippers, controllers: {
        sessions: 'shippers/sessions',
        registrations: 'shippers/registrations'
      }

  devise_for :employees, controllers: {
        sessions: 'employees/sessions',
        registrations: 'employees/registrations'
      }

  # devise_for :shippers
  # devise_for :hauliers
  # devise_for :employees

  resources :hauliers do
    resources :jobs
  end

  resources :shippers do
    resources :jobs
  end
end
