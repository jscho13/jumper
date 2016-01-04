class VenueCategorization < ActiveRecord::Migration
  def change
    create_table :venue_categorization do |table|
      table.integer :venue_id, null: false
      table.integer :category_id, null: false

      table.timestamps null: false
    end
  end
end
