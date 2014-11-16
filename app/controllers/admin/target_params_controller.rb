class Admin::TargetParamsController < Admin::BaseController
  before_action :set_target_param, only: [:show, :edit, :update, :destroy]

  expose :target_param,     attributes: :target_param_params
  params_for :target_param#, :email, :password, :password_confirmation, :locale

  def index
    @target_params = TargetParam.all
  end

  def show
  end

  def edit
  end

  def new
    @target_param = TargetParam.new
  end

  def create
    @target_param = TargetParam.new(target_param_params)

    if @target_param.save
      redirect_to edit_admin_target_param_path(@target_param), notice: t('messages.target_params.created')
    else
      render :new
    end
  end

  def update
    if @target_param.update(target_param_params)
      redirect_to edit_admin_target_param_path(@target_param), notice: t('messages.target_params.updated')
    else
      render :edit
    end
  end

  def destroy
    @target_param.destroy

    redirect_to admin_target_params_path, notice: t('messages.target_params.destroyed')
  end

  private

  def set_target_param
    @target_param = TargetParam.find(params[:id])
  end
end
