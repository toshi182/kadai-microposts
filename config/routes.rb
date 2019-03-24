Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      #フォロー中のユーザとフォローされているユーザ一覧を表示するためのルーティング
      get :followings
      get :followers
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationsships, only: [:create, :destroy]
  #ログインユーザーがユーザーをフォロー/アンフォローできるようにする
  #フォロー/アンフォローはviewで設置
end