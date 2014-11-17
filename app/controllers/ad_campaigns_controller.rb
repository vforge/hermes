class AdCampaignsController < BaseController
  before_action :set_ad_campaign, only: [:show, :edit, :update, :destroy]

  expose :ad_campaign,     attributes: :ad_campaign_params
  params_for :ad_campaign#, :email, :password, :password_confirmation, :locale

  def index
    @ad_campaigns = AdCampaign.all
  end

  def show
  end

  def edit
  end

  def new
    @ad_campaign = AdCampaign.new
  end

  def create
    @ad_campaign = AdCampaign.new(ad_campaign_params)

    if @ad_campaign.save
      redirect_to edit_ad_campaign_path(@ad_campaign), notice: t('messages.ad_campaigns.created')
    else
      render :new
    end
  end

  def update
    if @ad_campaign.update(ad_campaign_params)
      redirect_to edit_ad_campaign_path(@ad_campaign), notice: t('messages.ad_campaigns.updated')
    else
      render :edit
    end
  end

  def destroy
    @ad_campaign.destroy

    redirect_to ad_campaigns_path, notice: t('messages.ad_campaigns.destroyed')
  end

  private

  def set_ad_campaign
    @ad_campaign = AdCampaign.find(params[:id])
  end
end
