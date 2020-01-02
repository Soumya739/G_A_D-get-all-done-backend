Rails.application.routes.draw do
  resources :categories
  post "/users/:id", to: "users#show"
  resources :users
  resources :contractors
  resources :contractees
  post "/user_posts", to: "posts#getContracteePosts"
  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
