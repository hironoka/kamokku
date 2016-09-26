class CreateKus < ActiveRecord::Migration
  def change
    create_table :kus do |t|
      t.string      :ku
      t.integer     :user_id
      t.integer     :kukai_id
      t.integer     :season
      t.timestamps
    end
  end
end
