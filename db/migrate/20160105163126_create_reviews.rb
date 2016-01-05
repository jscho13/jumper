class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
     t.integer :rating, null: false
     t.text :review_body
     t.integer :activity_id, null: false
     t.integer :user_id, null: false
     t.integer :delete_ind

     t.timestamps
    end
  end
end
