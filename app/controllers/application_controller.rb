class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :authenticate_user
  skip_before_action :authenticate_user, if: :devise_controller?

  private

  def authenticate_user
    redirect_to new_user_session_path, flash: { alert: t(:flash) } unless current_user.present?
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
