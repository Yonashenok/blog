Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # get "/users", to: "users#index" 
  # get "/users/:id", to: "users#show"
  # get "/users/:user_id/posts", to: "posts#index"
  # get "/users/:user_id/posts/:id", to: "posts#show"
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :likes, only: [:create]
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users ,only: [:index] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create] 
      end
    end
  end
end

end
