class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments.accessible_by(current_ability)
  end
end
