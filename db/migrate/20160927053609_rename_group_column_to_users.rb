class RenameGroupColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :group, :group_id
  end
end
