class ContribController < ApplicationController
  def choose
    redirect_to root_path unless current_user.status == "admin"
  end
end
