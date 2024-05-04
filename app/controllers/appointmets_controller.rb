class AppointmetsController < ApplicationController

  def create
    @doctor = Doctor.find(params[:doctor_id])
    if @doctor.allow_new_appointments?
      @appointments = Appointment.new

      @appointments.user_id = current_user.id
      @appointments.doctor_id = params[:doctor_id]
      @appointments.opens = true
      @appointments.save
      redirect_to doctor_path(params[:doctor_id])
    else
      redirect_to doctor_path(params[:doctor_id]), alert: "Registration closed, try again later"
    end
  end
end
