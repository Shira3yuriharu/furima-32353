class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday,])
    #:sign_in(ログイン)はメールアドレスとパスワードのみであり、当２項目は初期設定で受け取りが許可されている為、記述しない
    #:account_update(アカウント情報の更新)はフリマアプリの実装要件ではない為、記述しない
  end
end
