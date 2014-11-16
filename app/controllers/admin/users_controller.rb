class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  expose :user,     attributes: :user_params
  params_for :user, :email, :password, :password_confirmation, :locale

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to edit_admin_user_path(@user), notice: t('messages.users.created')
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user), notice: t('messages.users.updated')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to admin_users_path, notice: t('messages.users.destroyed')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
