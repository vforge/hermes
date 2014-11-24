class API::V1::ContentController < ActionController::Base
  def get
    @object = Ad.with_status(:active).order_by_rand.first
    @object.increment!(:count_requests)
  end

  def click
    @object = Ad.with_status(:active).find(params[:id])
    @object.increment!(:count_clicks)

    redirect_to @object.href
  end
end
