class AdCampaignsController < BaseController
  before_action :set_ad_campaign, only: [:show, :edit, :update, :destroy, :activate, :inactivate]

  expose :ad_campaign,     attributes: :ad_campaign_params
  params_for :ad_campaign, :name, :company, :starting_at, :ending_at

  def activate
    @ad_campaign.status = :active
    @ad_campaign.save
    redirect_to ad_campaigns_path, notice: t('messages.ad_campaigns.activated', name: @ad_campaign.name, company: @ad_campaign.company)
  end

  def inactivate
    @ad_campaign.status = :inactive
    @ad_campaign.save
    redirect_to ad_campaigns_path, notice: t('messages.ad_campaigns.inactivated', name: @ad_campaign.name, company: @ad_campaign.company)
  end

  def index
    @ad_campaigns = AdCampaign.all.includes(:ads)
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
      redirect_to edit_ad_campaign_path(@ad_campaign), notice: t('messages.ad_campaigns.created', name: @ad_campaign.name, company: @ad_campaign.company)
    else
      render :new
    end
  end

  def update
    if @ad_campaign.update(ad_campaign_params)
      redirect_to edit_ad_campaign_path(@ad_campaign), notice: t('messages.ad_campaigns.updated', name: @ad_campaign.name, company: @ad_campaign.company)
    else
      render :edit
    end
  end

  def destroy
    @ad_campaign.destroy

    redirect_to ad_campaigns_path, notice: t('messages.ad_campaigns.destroyed', name: @ad_campaign.name, company: @ad_campaign.company)
  end

  private

  def set_ad_campaign
    @ad_campaign = AdCampaign.find(params[:id])
  end
end
