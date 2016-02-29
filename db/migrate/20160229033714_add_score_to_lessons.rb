class AddScoreToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :score, :integer, default: 0
  end
end
