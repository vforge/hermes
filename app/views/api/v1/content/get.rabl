object @object => false

attribute :id, :href, :resource_url

glue @object.ad_campaign do
  attributes :company, :name
end
