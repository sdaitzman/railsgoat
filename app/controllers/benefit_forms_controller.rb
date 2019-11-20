# frozen_string_literal: true
class BenefitFormsController < ApplicationController

  def index
    @benefits = Benefits.new
  end

  def download
   begin
     path = File.join('public', 'docs', params[:name])
     file = params[:type].constantize.new(path)
     send_file file, disposition: "attachment"
   rescue
     response_status = { status: 404, notice: "File not found" }
     redirect_to(user_benefit_forms_path(user_id: current_user.id), response_status)
   end
  end

  def upload
    file = params[:benefits][:upload]
    if file
      flash[:success] = "File Successfully Uploaded!"
      Benefits.save(file, params[:benefits][:backup])
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to user_benefit_forms_path(user_id: current_user.id)
  end

end
