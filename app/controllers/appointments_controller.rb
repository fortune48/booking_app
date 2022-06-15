class AppointmentsController < ApplicationController
  def new
    @user = current_user
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:fixed_date, :description, user_ids:[])
  end
end
