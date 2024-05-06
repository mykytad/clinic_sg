class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to categories_path
    elsif doctor_signed_in?
      redirect_to appointmets_path(doctor_id: current_doctor.id)
    else
      redirect_to new_user_session_path
    end
  end
end
