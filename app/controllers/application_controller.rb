class ApplicationController < ActionController::Base
  before_action do
    ActiveStorage::Current.url_options = {protocol: request.protocol, host: request.host, port: request.port}
    # ActiveStorage::Current.url_options = { protocol: "http://", host: "localhost", port: "3000" }
  end

  before_action :set_locale

  def set_locale
    if params[:locale].present?
      cookies[:locale] = params[:locale]
      I18n.locale = params[:locale]
    elsif cookies[:locale].present?
      I18n.locale = cookies[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end

  def become
    if current_user.is_admin?
      user = User.find_by(username: params[:id])
      sign_in(:user, user)
      redirect_to root_url, notice: "logged in as #{user.username}"
    else
      redirect_to root_url, error: "not allowed"
    end
  end
end
