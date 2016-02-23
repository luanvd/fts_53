class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :lesson_id
      t.integer :question_id
      t.integer :question_answer_id

      t.timestamps null: false
    end
  end
end
