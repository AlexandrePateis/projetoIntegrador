class AddDescriptionToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :description, :string

  end
end
