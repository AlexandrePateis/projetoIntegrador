class AddDatetimeToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :datetime, :datetime
  end
end
