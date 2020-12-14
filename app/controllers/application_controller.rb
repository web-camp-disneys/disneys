class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # セキュリティの記述？
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。

  def after_sign_in_path_for(resource)
    # sign_in sign_up後のページ遷移指定
    admin_path
  end

  def after_sign_out_path_for(resource)
    admin_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
