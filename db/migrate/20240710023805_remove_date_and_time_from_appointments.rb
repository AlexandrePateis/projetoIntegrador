class RemoveDateAndTimeFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :date, :date
    remove_column :appointments, :time, :time
  end
end
