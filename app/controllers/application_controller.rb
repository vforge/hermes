class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include BodyClasses

  extend ParamsFor

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  before_action :setup_application

  def setup_application
    session[:locale] = I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize_user
    redirect_to join_url, alert: I18n.t('messages.unauthorized') if current_user.nil? || current_user.id.nil?
  end

  def authorize_admin
    redirect_to join_url, alert: I18n.t('messages.unauthorized') unless current_user && current_user.role.admin?
  end
end
