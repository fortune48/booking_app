class DashboardsController < ApplicationController
  def index
    @active_appointments = current_user.active_appointments
    @inactive_appointments = current_user.inactive_appointments
  end
end
