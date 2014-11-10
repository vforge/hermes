# fugly hack http://stackoverflow.com/questions/5267998/rails-3-field-with-errors-wrapper-changes-the-page-appearance-how-to-avoid-t
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag
  # class_attr_index = html_tag.index 'class="'
  #
  # if class_attr_index
  #   html_tag.insert class_attr_index + 7, 'error '
  # else
  #   html_tag.insert html_tag.index('>'), ' class="error"'
  # end
end
