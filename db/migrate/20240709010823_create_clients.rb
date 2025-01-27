class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
