Rails.application.routes.draw do
  devise_for :customers
  root to: 'public/homes#top'

# 12/14種坂　下記、namespace実装で不要になるかもしれません
# また、新規登録画面のみの記載です。ログイン、ログアウトはなぜか指定せずとも動きました。
  get 'customers/sign_up' => 'customers/registrations#new'
end
