class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |table|
      table.integer :rating, null: false
      table.text :review_body
      table.integer :activity_id
      table.integer :user_id
      table.integer :delete_ind

      table.timestamps null: false
    end
  end
end
