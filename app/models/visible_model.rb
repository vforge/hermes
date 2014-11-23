class VisibleModel < ActiveRecord::Base
  self.abstract_class = true

  default_scope { where("visible = 't'") }

  def destroy
    self.visible = false
    self.quiet_save
  end
end
