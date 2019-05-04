Rails.application.routes.draw do
  # config/routes.rbの役目
  # どのURLが、どのControllerのどのActionに紐づくかを決めている
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    # index, show, new, create, edit, update, destroy以外のルーティングを追加する
    member do
      #フォロー中のユーザとフォローされているユーザ一覧を表示するためのルーティング
      get :followings
      get :followers
      get :likes
      
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  #ログインユーザーがユーザーをフォロー/アンフォローできるようにする
  #フォロー/アンフォローはviewで設置
end