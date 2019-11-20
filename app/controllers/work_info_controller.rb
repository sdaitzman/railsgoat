# frozen_string_literal: true
class WorkInfoController < ApplicationController
  def index
    @user = current_user.admin? ? User.find_by(id: params[:user_id]) : current_user
    if !(@user)
      flash[:error] = "Sorry, no user with that user id exists"
      redirect_to home_dashboard_index_path
    end
  end

end
