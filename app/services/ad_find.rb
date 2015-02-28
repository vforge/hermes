class AdFind
  include Service

  attribute :params, Hash[Symbol => String]

  def call
    ad = Ad.search(params).first

    if params[:debug].nil? && ad.present?
      Stat.record :impression, ad, (params[:uuid] or 0)
    end

    ad
  end
end
