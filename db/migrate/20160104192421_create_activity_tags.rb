class CreateActivityTags < ActiveRecord::Migration
  def change
    create_table :activity_tags do |table|
      table.integer :activity_id, null: false
      table.integer :tag_id, null: false

      table.timestamps null: false
    end
  end
end
