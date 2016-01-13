class AddColumnReviewCount < ActiveRecord::Migration
  def change
    add_column :reviews, :revup_count, :integer, default: 0, null: false
    add_column :reviews, :revdown_count, :integer, default: 0, null: false
  end
end
