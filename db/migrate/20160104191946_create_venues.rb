class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |table|
      table.string :venue_name, null: false
      table.string :address
      table.string :zip_code
      table.string :city

      table.timestamps null: false
    end
  end
end
