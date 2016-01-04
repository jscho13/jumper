class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |table|
      table.string :activity_name, null: false
      table.text :description
      table.integer :public_event
      table.integer :venue_id
      table.integer :attendee_count
      table.integer :price_range

      table.timestamps null: false
    end
  end
end
