class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def show
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments.where(user_id: current_user.id)
    @currect_appointment = @appointments.where(opens: true).any?
  end
end
