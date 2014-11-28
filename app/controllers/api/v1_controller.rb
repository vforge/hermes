class API::V1Controller < ActionController::Base
  def get
    @object = Ad.search_by_params(params).first
    @object.increment!(:count_requests)
  end

  def click
    @object = Ad.with_status(:active).find(params[:id])
    @object.increment!(:count_clicks)

    redirect_to @object.href
  end
end
