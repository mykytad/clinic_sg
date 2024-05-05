class DoctorsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authenticate_doctor!

  def show
    if doctor_signed_in?
      @doctor = Doctor.find(params[:id])
      @appointments = @doctor.appointments
    elsif user_signed_in?
      @doctor = Doctor.find(params[:id])
      @appointments = @doctor.appointments.where(user_id: current_user.id)
      @currect_appointment = @appointments.where(opens: true).any?
    else
      redirect_to root_path
    end
  end
end
