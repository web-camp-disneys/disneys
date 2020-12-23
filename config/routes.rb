Rails.application.routes.draw do


  namespace :public do
    resources :items, only:[:index,  :show]
  end
  # 管理者が見る商品情報
  namespace :admins do
    resources :items, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  end

  #管理者が見る商品ジャンル
  namespace :admins do
    resources :genres, only:[:index, :create, :edit, :update, :destroy]
  end

  # 管理者が見る利用者情報
  namespace :admins do
    resources :customers, only:[:index, :show, :edit, :update]
  end

  namespace :admins do
    resources :orders, only:[:index, :show, :update]
  end

  namespace :admins do
    resources :order_detais, only:[:update]
  end

  get 'admin' => 'admins/homes#top'

  # 管理者namespace
  devise_for :admin, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # resources :admins, only: [:new]

  # devise_for :customers


# 12/14種坂　下記、namespace実装で不要になるかもしれません
# また、新規登録画面のみの記載です。ログイン、ログアウトはなぜか指定せずとも動きました。
  # get 'customers/sign_up' => 'customers/registrations#new'

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
   get '/customers/my_page' => 'customers#show'
   get '/customers/edit' => 'customers#edit'
   patch '/customers' => 'customers#update'
     # resources :customers, only:[] do
     # member do
     # memberはurlにidを含む(resources)
     # collectionはidを含まない(resource)みたいなもの
         get "customers/unsubscribe" => 'customers#unsubscribe'
         #ユーザーの会員状況を取得
         patch "customers/withdrawl" => 'customers#withdrawl'
         #ユーザーの会員状況を更新
         # end
       # end
     # end
   devise_for :customers,  controllers: {
   sessions:      'public/sessions',
   passwords:     'public/passwords',
   registrations: 'public/registrations'
 }

# タネサカ仮ルーティング12/18
resources :cart_items, only:[:index, :create, :update, :destroy] do
    collection do
    delete 'destroy_all'
    end
  end
 end

  # 配送先
  scope module: :public do
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end

  namespace :public do
    resources :orders, only:[:index, :new, :show, :create] do
      collection  do
        get :complete
        get :confirm
      end
    end
  end

end