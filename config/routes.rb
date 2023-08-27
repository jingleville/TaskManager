# == Route Map
#

Rails.application.routes.draw do

  resources :groups do
    resources :procedures do
      resources :stages
      resources :projects
      get '/groups/:group_id/procedures/:procedure_id/stages/:id/next', to: 'stages#next', as: 'stage_next'
      get '/groups/:group_id/procedures/:procedure_id/stages/:id/previous', to: 'stages#previous', as: 'stage_previous'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
