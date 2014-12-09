module BodyClasses
  extend ActiveSupport::Concern

  included do
    before_action do
      full_controller_name = controller_path.gsub('/', '-')

      @body_classes = ["#{full_controller_name}--common", "#{full_controller_name}-#{action_name}"]
    end
  end
end
