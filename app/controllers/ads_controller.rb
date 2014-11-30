class AdsController < BaseController
  before_action :set_ad_campaign
  before_action :set_ad, only: [:show, :edit, :update, :destroy, :activate, :inactivate]

  expose :ad,     attributes: :ad_params
  params_for :ad, :filename, :href, :ad_size_id

  def activate
    @ad.status = :active
    @ad.save!
    redirect_to ad_campaign_ads_path(@ad_campaign), notice: t('messages.ads.activated')
  end

  def inactivate
    @ad.status = :inactive
    @ad.save!
    redirect_to ad_campaign_ads_path(@ad_campaign), notice: t('messages.ads.inactivated')
  end

  def index
    @ads = @ad_campaign.ads
  end

  def show
  end

  def edit
  end

  def new
    @ad = @ad_campaign.ads.new
  end

  def create
    @ad = @ad_campaign.ads.new(ad_params)

    if @ad.save
      redirect_to edit_ad_campaign_ad_path(@ad_campaign, @ad), notice: t('messages.ads.created')
    else
      render :new
    end
  end

  def update
    if @ad.update(ad_params)
      redirect_to edit_ad_campaign_ad_path(@ad_campaign, @ad), notice: t('messages.ads.updated')
    else
      render :edit
    end
  end

  def destroy
    @ad.destroy

    redirect_to ad_campaign_ads_path(@ad_campaign), notice: t('messages.ads.destroyed')
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def set_ad_campaign
    @ad_campaign = AdCampaign.find(params[:ad_campaign_id])
  end
end
