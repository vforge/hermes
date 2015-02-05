class AdFind
  include Service

  attribute :params, Hash[Symbol => String]

  def call
    ad = Ad.with_status(:active).find(params[:id])

    unless params[:debug]
      Stat.record :click, ad, (params[:uuid] or 0)
    end

    ad
  end
end
