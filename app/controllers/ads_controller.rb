class AdsController < ApplicationController
  before_action :set_ads, only: [:show, :edit, :update, :destroy]

  expose :ads,     attributes: :ads_params
  params_for :ads#, :email, :password, :password_confirmation, :locale

  def index
    @adss = AdCampaign.all
  end

  def show
  end

  def edit
  end

  def new
    @ads = AdCampaign.new
  end

  def create
    @ads = AdCampaign.new(ads_params)

    if @ads.save
      redirect_to edit_admin_ads_path(@ads), notice: t('messages.adss.created')
    else
      render :new
    end
  end

  def update
    if @ads.update(ads_params)
      redirect_to edit_admin_ads_path(@ads), notice: t('messages.adss.updated')
    else
      render :edit
    end
  end

  def destroy
    @ads.destroy

    redirect_to admin_adss_path, notice: t('messages.adss.destroyed')
  end

  private

  def set_ads
    @ads = AdCampaign.find(params[:id])
  end
end
