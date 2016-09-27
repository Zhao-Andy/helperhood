Rails.application.routes.draw do
  # homepage
  get '/' => 'pages#home'

  # users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  patch '/users' => 'users#update'

  # sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # profiles
  get '/profile' => 'profiles#show'
  get '/profile/resident/new' => 'profiles#new_resident'
  get '/profile/nonprofit/new' => 'profiles#new_nonprofit'
  get '/profile/edit' => 'profiles#edit'

  # programs
  get '/programs' => 'programs#index'
  get '/programs/map' => 'programs#map_index'
  get '/my-programs' => 'programs#resident_index'
  get '/np-programs' => 'programs#nonprofit_index'
  get '/np-programs' => 'programs#np_map_index'
  get '/my-programs/map' => 'programs#res_map_index'
  get '/programs/new' => 'programs#new'
  get '/programs/:id' => 'programs#show'
  get '/programs/:id/edit' => 'programs#edit'

  namespace :api do
    # programs
    get '/programs' => 'programs#index'
    get '/my-programs' => 'programs#resident_index'
    get '/np-programs' => 'programs#nonprofit_index'
    get '/programs/:id' => 'programs#show'
    post '/programs' => 'programs#create'
    patch 'programs' => 'programs#update'
    delete 'programs/:id' => 'programs#destroy'

    # profiles
    get '/profiles' => 'profiles#index'
    get '/profiles/:id' => 'profiles#show'
    post '/profiles' => 'profiles#create'
    patch '/profiles' => 'profiles#update'

    # resident_programs
    get '/resident_programs' => 'resident_programs#index'
    get '/resident_programs/:id' => 'resident_programs#show'
    post '/resident_programs' => 'resident_programs#toggle_support_status'
    post '/resident_programs_volunteer' => 'resident_programs#toggle_volunteer_status'
    # volunteer is NOT a toggle, use form maybe?
    patch '/resident_programs' => 'resident_programs#update'

    # donations
    get '/donations' => 'donations#index'
    get '/donations/:id' => 'donations#show'
    post '/donations' => 'donations#create'
    patch '/donations' => 'donations#update'

    # nonprofit_programs
    get '/nonprofit_programs' => 'nonprofit_programs#index'
    get '/nonprofit_programs/:id' => 'nonprofit_programs#show'
    post '/nonprofit_programs' => 'nonprofit_programs#create'
    patch '/nonprofit_programs' => 'nonprofit_programs#update'
  end
end
