Rails.application.routes.draw do

  resources :species do
    resources :sightings
  end
  
  root 'welcome#index'
end
