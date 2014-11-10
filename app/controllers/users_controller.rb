class UsersController < ApplicationController
  before_action :authorize_admin
end
