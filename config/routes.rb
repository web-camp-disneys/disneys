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

  devise_for :customers

  root to: 'public/homes#top'

# 12/14種坂　下記、namespace実装で不要になるかもしれません
# また、新規登録画面のみの記載です。ログイン、ログアウトはなぜか指定せずとも動きました。
  get 'customers/sign_up' => 'customers/registrations#new'


end