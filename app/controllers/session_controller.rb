class SessionController < ApplicationController
  before_action :authorize_anon, except: [:destroy]

  def new
  end

  def create
    user = User.where(email: params[:email].chomp).first

    if user && user.authenticate(params[:password].chomp)
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: t('messages.session.logged_in', user: user.email)
    else
      flash.now.alert = t('messages.session.error')
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to join_path, notice: t('messages.session.logged_out')
  end
end
