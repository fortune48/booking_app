class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :fixed_date
      t.text :description

      t.timestamps
    end
  end
end
