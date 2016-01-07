class RemoveColumnsActivities < ActiveRecord::Migration
  def up
    remove_index :activities, [:activity_name, :venue_id]
    remove_column :activities, :venue_id, :integer
  end

  def down
    add_column :activities, :venue_id, :integer
    add_index :activities, [:activity_name, :venue_id], unique: true
  end
end
