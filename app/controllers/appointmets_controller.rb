class AppointmetsController < ApplicationController
  # before_action :authenticate_doctor!, only: [:index, :edit, :update]

  def index
    @doctor = Doctor.find(params[:doctor_id])
    @appointments = @doctor.appointments.where(opens: true)
  end

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

  def edit
    if authenticate_doctor!
      @appointment = Appointment.find(params[:id])
    end
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      @appointment.opens = false
      @appointment.save
      redirect_to appointmets_path(:doctor_id => current_doctor.id)
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:recommendation, :opens)
  end
end
