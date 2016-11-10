Rails.application.routes.draw do

  root 'home#index'

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

    ## SAMPLE

    #HTTP        #model     #ID        #model #ID            #Controller     #action/method       #used in link_to and form_for
    #get         'shippers/:shipper_id/jobs/:id',       to: 'jobs       #    show',          as: 'job'

    # GET
    get '/jobs', to: 'shippers#jobs_show', as: 'jobs_show'
    get '/shippers', to: 'shippers#index', as: 'shippers_index'
    get 'shippers/:id/new_job', to: 'shippers_job#create', as: 'shippers_job_create'
    get 'shippers/:id', to: 'shipper#update', as: 'shipper_update'
    get 'shippers/:shipper_id/jobs/:id', to: 'jobs#show'

    # POST
    post '/job', to: 'shipper_job#create', as: 'shipper_job'

    # PATCH
    patch 'shipper/:job_id', to: 'job#update'
    patch 'shipper/:shipper_id', to: 'shipper#edit', as: 'shipper_edit'

    # DELETE
    delete 'shipper_job/:job_id', to: 'shipper_job#destroy', as: 'destroy_shipper_job'






  # devise_for :shippers
  # devise_for :hauliers
  # devise_for :employees

  # resources :hauliers do
  #   resources :jobs
  # end
  #
  # resources :shippers do
  #   resources :jobs
  # end
end
