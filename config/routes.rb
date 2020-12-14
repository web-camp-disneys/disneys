Rails.application.routes.draw do
  devise_for :admin
  devise_for :publics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/admin' => 'admins/homes#top'
  # どのフォルダのどのcontrollerのアクションかを指定
end
