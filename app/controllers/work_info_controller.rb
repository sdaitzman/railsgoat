# frozen_string_literal: true
class WorkInfoController < ApplicationController
  def index
    if is_admin?
      @user = User.find_by(id: params[:user_id])
    else
      @user = current_user
    end
    if !(@user) || @user.admin
      flash[:error] = "Sorry, no user with that user id exists"
      redirect_to home_dashboard_index_path
    end
  end

end



  