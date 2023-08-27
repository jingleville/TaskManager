# == Route Map
#

Rails.application.routes.draw do

  get '/groups/:group_id/procedures/:procedure_id/stages/:id/next', 
      to: 'stages#next', 
      as: 'stage_next'
  get '/groups/:group_id/procedures/:procedure_id/stages/:id/previous', 
      to: 'stages#previous', 
      as: 'stage_previous'

  get '/groups/:group_id/procedures/:procedure_id/projects/:id/move_forward', 
      to: 'projects#move_forward', 
      as: 'project_stage_next'
  get '/groups/:group_id/procedures/:procedure_id/projects/:id/move_back', 
      to: 'projects#move_back', 
      as: 'project_stage_back'


  resources :groups do
    resources :procedures do
      resources :stages
      resources :projects
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
