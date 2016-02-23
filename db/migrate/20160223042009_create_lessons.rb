class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
