class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :user_id
      t.integer :subject_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
