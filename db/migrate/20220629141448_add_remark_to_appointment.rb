class AddRemarkToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :remark, :text
  end
end
