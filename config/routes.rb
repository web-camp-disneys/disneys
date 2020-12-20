Rails.application.routes.draw do
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

  get 'admin' => 'admins/homes#top'

  # 管理者namespace
  devise_for :admin, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # resources :admins, only: [:new]

  # devise_for :customers

  root to: 'public/homes#top'

# 12/14種坂　下記、namespace実装で不要になるかもしれません
# また、新規登録画面のみの記載です。ログイン、ログアウトはなぜか指定せずとも動きました。
  # get 'customers/sign_up' => 'customers/registrations#new'

#   controllers: {
#   sessions:      'public/sessions',
#   passwords:     'public/passwords',
#   registrations: 'public/registrations'
# }

# 下記resources :customers, only:[:show, :edit, :update]はdevise_for :customersより下に記載をお願い致します。12/17タネサカ
scope module: :public do
  devise_for :customers, skip: :registrations
  # skip URL飛ばし
  devise_scope :customers do
  # devise_scope 飛ばしたURLから使用するものを記述
    get 'customers/sign_up' => 'registrations#new'
    get 'customers/edit/pass' => 'registrations#edit'
    # 下記editとURLが一緒な為変更
    post 'customers' => 'registrations#create'
  end

  get '/customers/my_page' => 'customers#show'
  get '/customers/edit' => 'customers#edit'
  patch '/customers' => 'customers#update'
  # put '/customers' => 'customers#update'
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
end

  # 配送先
  scope module: :public do
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end


end