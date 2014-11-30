class_name = 'flag'
class_name += ' active' if @current_locale == locale

link_to params.merge(locale: locale) do
  image_tag "flags/#{locale}.png", alt: t("enumerize.user.locale.#{locale}"), class: class_name
end
