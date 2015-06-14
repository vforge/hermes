class RedirectController < ApplicationController
  def root
    if current_user.present?
      redirect_to ad_campaigns_path
    else
      redirect_to join_path
    end
  end
end
