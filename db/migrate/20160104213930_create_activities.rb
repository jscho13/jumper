class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_name, null: false
      t.text :description
      t.integer :venue_id
      t.integer :price_range

      t.timestamps null: false
      t.index [:activity_name, :venue_id], unique: true
    end
  end
end
