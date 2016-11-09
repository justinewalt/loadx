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

    # GET
    get '/jobs', to: 'shippers#jobs_show', as: 'jobs_show'
    get '/shippers', to: 'shippers#index', as: 'shippers_index'
    get 'make/:make_id/forum/:forum_id/topic/:topic_id', to: 'makes#topic', as: 'topic'
    get 'user/:user_id/profile', to: 'profile#show', as: 'profile'
    get 'profile/:user_id/edit', to: 'profile#edit', as: 'edit_profile'
    get 'user_car/:id', to: 'user_cars#new', as: 'new_user_car'
    get 'user_car/edit/:id', to: 'user_cars#edit', as: 'edit_user_car'
    get 'make/:make_id/forum/:forum_id/topics/new', to: 'topics#new', as: 'new_topic'
    get 'make/:make_id/forum/:forum_id/topic/:id/edit', to: 'topics#edit', as: 'edit_topic'
    get 'make/:make_id/forum/:forum_id/topic/:topic_id/new_post', to: 'posts#new', as: 'new_post'
    get 'make/:make_id/forum/:forum_id/topic/:topic_id/post/:id/edit', to: 'posts#edit', as: 'edit_post'
    get 'favorite_make/:id', to: 'favorites#make', as: 'favorite_make'
    get 'favorite_forum/:id', to: 'favorites#forum', as: 'favorite_forum'
    get 'favorite_topic/:id', to: 'favorites#topic', as: 'favorite_topic'

    # POST
    post '/job', to: 'shipper_job#create', as: 'shipper_job'
    post 'make/:make_id/forum/:forum_id/topics/new', to: 'topics#create', as: 'make_forum_topics'
    post 'make/:make_id/forum/:forum_id/topic/:topic_id/new_post', to: 'posts#create', as: 'make_forum_topic_posts'

    # PATCH
    patch 'user/:user_id/profile', to: 'profile#update'
    patch 'user_car/:id', to: 'user_cars#update', as: 'user_car'
    patch 'make/:make_id/forum/:forum_id/topic/:topic_id/post/:id/edit', to: 'posts#update', as: 'make_forum_topic_post'
    patch 'make/:make_id/forum/:forum_id/topic/:id/edit', to: 'topics#update', as: 'make_forum_topic'

    # DELETE
    delete 'user_car/:id', to: 'user_cars#destroy', as: 'destroy_user_car'

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
