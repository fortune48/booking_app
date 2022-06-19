class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end
  
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      @appointment.users << User.find(params["appointment"]["user_ids"])
      redirect_to new_appointment_path, notice: "Appointment Created Successfully"
    else
      redirect_to new_appointment_path, alert: @appointment.errors.messages
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:fixed_date, :description, :user_id)
  end
end
