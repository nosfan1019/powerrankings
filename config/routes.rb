Power::Application.routes.draw do
  resources :testers
  resources :relocates
  resources :sources
  resources :rankings
  resources :teams
  
  match 'averages' => 'Average#index'
  match 'weighted' => 'Average#weighted'
  match 'sortable' => 'Average#sortable'
  
  get '/testajax', to: 'testers#testajax'
  get '/ryan', to: 'testers#ryan'

  get "home/index"

  resources :home

  root :to => "home#index"

  resources :sports do
    resources :teams
  end

end
