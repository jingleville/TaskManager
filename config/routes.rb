# == Route Map
#

Rails.application.routes.draw do
  resources :projects
  resources :groups do
    resources :procedures do
      resources :stages
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
