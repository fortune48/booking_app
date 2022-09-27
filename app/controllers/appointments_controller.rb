class AppointmentsController < ApplicationController
  before_action :get_appointment, only: [:edit, :update, :show]

  def index
    @appointments = Appointment.all
  end

  def edit 
  end

  def show
    @doctor = @appointment.users.where(role: 'doctor').pluck(:first_name, :last_name).flatten.join(' ')
  end

  def update 
    if @appointment.update(appointment_params)
      redirect_to dashboards_index_path, notice: "Updated Successfully"
    else
      redirect_to edit_appointment_path(@appointment), alert: @appointment.errors.messages
    end
  end
  
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      @appointment.users << User.find(params["appointment"]["user_ids"])
      @appointment.users << current_user
      redirect_to dashboards_index_path, notice: "Appointment Created Successfully"
    else
      redirect_to new_appointment_path, alert: @appointment.errors.messages
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    redirect_to dashboards_index_path, status: :see_other
  end

  private

  def appointment_params
    params.require(:appointment).permit(:fixed_date, :description, :user_id)
  end

  def get_appointment
    @appointment = Appointment.find(params[:id])
  end
end
