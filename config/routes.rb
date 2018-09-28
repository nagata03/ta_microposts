Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :microposts, only: [:create, :destroy]  # showに該当する一覧はユーザに紐づいているので、users#showで表示する
  resources :relationships, only: [:create, :destroy]
end
