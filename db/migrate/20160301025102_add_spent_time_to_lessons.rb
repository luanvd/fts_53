class AddSpentTimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :spent_time, :integer
  end
end
