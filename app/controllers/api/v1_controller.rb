class API::V1Controller < ActionController::Base

  # params
  # - wm, wx - min/max width of an Ad
  # - hm, hx - min/max height of an Ad
  # - n - name of an Ad
  # - p - provider
  # - [debug] - do not count impressions / clicks

  def get
    @object = Ad.search(params).first

    unless params[:debug]
      Stat.record_impression @object, (params[:uuid] or 0)
    end
  end

  # params
  # - id - id of an Ad to click
  # - [debug] - do not count impressions / clicks

  def click
    @object = Ad.with_status(:active).find(params[:id])

    unless params[:debug]
      Stat.record_click @object, (params[:uuid] or 0)
    end

    redirect_to @object.href
  end
end
