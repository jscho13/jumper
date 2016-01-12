class RemoveVenueUniqueness < ActiveRecord::Migration
  def change
    remove_index :venues, column: :venue_name
  end
end
