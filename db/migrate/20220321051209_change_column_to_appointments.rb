class ChangeColumnToAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :date_time
    add_column :appointments, :date_time, :datetime
  end
end
