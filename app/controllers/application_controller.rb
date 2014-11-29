class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  extend ParamsFor

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  before_action :setup_application

  def setup_application
    # Load @controller_and_action_name from controller and action
    @controller_name = self.class.name.gsub('Controller', '').underscore.gsub('/', '-')
    @action_name     = action_name

    @body_classes = "#{@controller_name}--common #{@controller_name}-#{@action_name}"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize_user
    redirect_to join_url, alert: I18n.t('messages.unauthorized') if current_user.nil? || current_user.id.nil?
  end

  def authorize_anon
    redirect_to root_url, alert: I18n.t('messages.unauthorized') unless current_user.nil?
  end

  def authorize_admin
    redirect_to join_url, alert: I18n.t('messages.unauthorized') unless current_user && current_user.role.admin?
  end
end
