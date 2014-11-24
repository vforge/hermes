class API::V1::BaseController < ActionController::Metal
  include ActionController::Rendering        # enables rendering
  include ActionController::MimeResponds     # enables serving different content types like :xml or :json
  include AbstractController::Callbacks      # callbacks for your authentication logic

  # append_view_path "#{Rails.root}/app/views" # you have to specify your views location as well
end
