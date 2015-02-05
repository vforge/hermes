class API::V1Controller < ActionController::Base

  # params
  # - wm, wx - min/max width of an Ad
  # - hm, hx - min/max height of an Ad
  # - n - name of an Ad
  # - p - provider
  # - [debug] - do not count impressions / clicks
  # - [uuid] - unique user identifier

  def get
    render_unavailable if request.bot?

    @object = AdFind.call(params)
  end

  # params
  # - id - id of an Ad to click
  # - [debug] - do not count impressions / clicks
  # - [uuid] - unique user identifier

  def click
    render_unavailable if request.bot?

    redirect_to AdClick.call(params).href
  end
end
