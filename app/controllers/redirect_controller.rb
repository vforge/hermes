class RedirectController < ApplicationController
  def root
    if @current_user.present?
      redirect_to dashboard_path
    else
      redirect_to join_path
    end
  end
end
