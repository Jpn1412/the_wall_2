Rails.application.routes.draw do
  post '/save_comment', to: 'comments#save_comment'
  get '/edit_comment/:id', to: 'comments#edit_page'
  post '/update_comment', to: 'comments#update_comment'
  delete '/delete_comment', to: 'comments#delete_comment'

  post '/save_message', to: 'messages#save_message'
  get '/edit_message/:id', to: 'messages#edit_page'
  post '/update_message', to: 'messages#update_message'
  delete '/delete_message', to: 'messages#delete_message'

  get '/blog', to: 'blogs#index'
  post '/logout', to: 'blogs#logout'

  get '/login', to: 'users#login'
  post '/login_user', to: 'users#login_user'
  get '/registration', to: 'users#registration'
  post '/save_user', to: 'users#save_user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
