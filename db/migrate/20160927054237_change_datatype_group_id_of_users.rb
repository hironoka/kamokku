class ChangeDatatypeGroupIdOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :group_id, :integer
  end
end
