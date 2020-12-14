Rails.application.routes.draw do
  devise_for :customers
  root to: 'public/homes#top'

  get 'customers/sign_up' => 'customers/registrations#new'
end
