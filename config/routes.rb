# == Route Map
#

Rails.application.routes.draw do
  resources :groups do
    resources :procedures
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
