class AddDateToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :date_time, :datetime, :default => Time.now
  end
end
