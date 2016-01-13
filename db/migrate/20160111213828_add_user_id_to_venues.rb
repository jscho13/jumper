class AddUserIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :user_id, :integer, null: false
  end
end
