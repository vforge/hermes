module ApplicationHelper
  def percent(value, max, format)
    sprintf format, value.to_f.send(:/, max.to_f).send(:*, 100.0)
  end
end
