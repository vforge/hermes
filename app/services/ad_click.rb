class AdClick
  include Service

  attribute :params, Hash[Symbol => String]

  def call
    ad = Ad.with_status(:active).find(params[:id])

    if params[:debug].nil? && ad.present?
      Stat.record :click, ad, (params[:uuid] or 0)
    end

    ad
  end
end
