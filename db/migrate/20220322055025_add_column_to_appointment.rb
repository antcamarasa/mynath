class AddColumnToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :url_room, :string
  end
end
