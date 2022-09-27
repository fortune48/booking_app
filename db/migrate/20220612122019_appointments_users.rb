class AppointmentsUsers < ActiveRecord::Migration[7.0]
  def change
    create_join_table(:appointments, :users)
  end
end
