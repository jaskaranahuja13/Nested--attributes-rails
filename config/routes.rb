Rails.application.routes.draw do
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  root to: "users#index"
  resources :users do
    resources :posts do
      resources :comments

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
