Rails.application.routes.draw do
  # homepage
  get '/' => 'programs#homepage'

  # users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  patch '/users' => 'users#update'
  get '/users/unconfirmed' => 'users#unconfirmed' 

  # sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # profiles
  get '/profile' => 'profiles#show'
  get '/profile/resident/new' => 'profiles#new_resident'
  get '/profile/nonprofit/new' => 'profiles#new_nonprofit'
  get '/new_profile/edit' => 'profiles#edit'
  post '/new_profile' => 'profiles#create'
  patch '/profile' => 'profiles#update'

  # programs
  get '/programs' => 'programs#index'
  get '/programs/:name' => 'programs#show'
  get '/programs/new' => 'programs#new'
  post '/programs' => 'programs#create'
  patch 'programs/:name' => 'programs#update'
  delete 'programs/:name' => 'programs#destroy'
end