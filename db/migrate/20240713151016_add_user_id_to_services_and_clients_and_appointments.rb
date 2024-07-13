class AddUserIdToServicesAndClientsAndAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :services, :user, foreign_key: true
    add_reference :clients, :user, foreign_key: true
    add_reference :appointments, :user, foreign_key: true
  end
end
