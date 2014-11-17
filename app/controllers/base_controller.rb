class BaseController < ApplicationController
  before_action :authorize_user
end
