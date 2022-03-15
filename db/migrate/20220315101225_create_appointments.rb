class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.time :date_time
      t.references :users, foreign_key: true
      t.references :therapists, foreign_key: { to_table: "users"}

      t.timestamps
    end
  end
end
