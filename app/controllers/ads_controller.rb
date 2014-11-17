class AdsController < BaseController
  before_action :set_ads, only: [:show, :edit, :update, :destroy]

  expose :ads,     attributes: :ads_params
  params_for :ads#, :email, :password, :password_confirmation, :locale

  def index
    @ads = Ad.all
  end

  def show
  end

  def edit
  end

  def new
    @ads = Ad.new
  end

  def create
    @ads = Ad.new(ads_params)

    if @ads.save
      redirect_to edit_ads_path(@ads), notice: t('messages.ads.created')
    else
      render :new
    end
  end

  def update
    if @ads.update(ads_params)
      redirect_to edit_ads_path(@ads), notice: t('messages.ads.updated')
    else
      render :edit
    end
  end

  def destroy
    @ads.destroy

    redirect_to ads_path, notice: t('messages.ads.destroyed')
  end

  private

  def set_ads
    @ads = Ad.find(params[:id])
  end
end
