class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.text :review_patient
      t.text :review_therapist
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
