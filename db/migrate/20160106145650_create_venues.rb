class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_name, null: false
      t.string :street_name, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :city, null: false
      t.text :description
      t.integer :price_range

      t.timestamps null: false
      t.index [:venue_name], unique: true
    end
  end
end
