Rails.application.routes.draw do
  # HTTPVERB URL, to: 'CONTROLLER_NAME#ACTION_NAME'
  post '/users', to: 'users#create'
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  post '/users/login', to: 'users#login'
  get '/profile', to: 'users#show'
  resources :follows
  resources :elections
  resources :hometowns
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
