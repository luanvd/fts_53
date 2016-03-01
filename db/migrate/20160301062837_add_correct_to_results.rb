class AddCorrectToResults < ActiveRecord::Migration
  def change
    add_column :results, :correct, :boolean
  end
end
