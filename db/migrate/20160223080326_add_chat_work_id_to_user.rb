class AddChatWorkIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :chatworkid, :string
  end
end
