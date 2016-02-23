class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.text :content
      t.integer :question_id
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
