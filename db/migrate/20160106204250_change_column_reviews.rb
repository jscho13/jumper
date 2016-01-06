class ChangeColumnReviews < ActiveRecord::Migration
  def up
    add_column :reviews, :venue_id, :integer, null: false
    remove_column :reviews, :activity_id, :integer
  end

  def down
    add_column :reviews, :activity_id, :integer, null: false
    remove_column :reviews, :venue_id, :integer
  end
end
