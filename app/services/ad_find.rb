class AdFind
  include Service

  attribute :params, Hash[Symbol => String]

  def call
    ad = Ad.search(params).first

    unless params[:debug]
      Stat.record :impression, ad, (params[:uuid] or 0)
    end

    ad
  end
end
