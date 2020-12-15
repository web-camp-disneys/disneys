Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}
  get 'admin' => 'admins/homes#top'

  # 管理者deviseのデフォルト変更
  devise_for :admin, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

# <<<<<<< HEAD
# <<<<<<< HEAD
# =======

# 12/14種坂　下記、namespace実装で不要になるかもしれません
# また、新規登録画面のみの記載です。ログイン、ログアウトはなぜか指定せずとも動きました。
#   get 'customers/sign_up' => 'customers/registrations#new'
# >>>>>>> 1c6cc002e0d99abfeaf20dd11ddbfcf1ff702216
# =======
  # devise_for :customers

  # root to: 'public/homes#top'

# 12/14種坂　下記、namespace実装で不要になるかもしれません
# また、新規登録画面のみの記載です。ログイン、ログアウトはなぜか指定せずとも動きました。
  # get 'customers/sign_up' => 'customers/registrations#new'

end