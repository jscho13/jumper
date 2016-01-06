class RemoveColumnReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :delete_ind, :integer
  end
end
