class API::V1Controller < ActionController::Base
  def get
    @object = Ad.search(params).first
    @object.increment!(:count_requests) unless params[:test]
  end

  def click
    @object = Ad.with_status(:active).find(params[:id])
    @object.increment!(:count_clicks) unless params[:test]

    redirect_to @object.href
  end
end
