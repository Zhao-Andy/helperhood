Rails.application.routes.draw do

  get 'aide_types/create'

  get 'aide_types/update'

  get 'aide_types/destroy'

  # homepage
  get '/' => 'home_pages#home'

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
  get '/profile/edit' => 'profiles#edit'
  post '/profile' => 'profiles#create'
  patch '/profile' => 'profiles#update'

  # programs
  get '/programs' => 'programs#index'
  get '/my-programs' => 'programs#user_index'
  get '/programs/new' => 'programs#new'
  get '/programs/:id' => 'programs#show'
  get '/programs/:id/edit' => 'programs#edit'
  post '/programs' => 'programs#create'
  patch 'programs/:id' => 'programs#update'
  delete 'programs/:id' => 'programs#destroy'
end
