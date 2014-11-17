class AdSizesController < BaseController
  before_action :set_ad_size, only: [:show]

  def index
    @ad_sizes = AdSize.all
  end

  def show
  end

  private

  def set_ad_size
    @ad_size = AdSize.find(params[:id])
  end
end
