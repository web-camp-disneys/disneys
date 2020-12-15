Rails.application.routes.draw do
  get 'admin' => 'admins/homes#top'

  # 管理者namespace
  devise_for :admin, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # resources :admins, only: [:new]

  devise_for :customers
end
