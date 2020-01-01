Rails.application.routes.draw do
  resources :users
  resources :tasks
  resources :contractors
  resources :contractees
  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
