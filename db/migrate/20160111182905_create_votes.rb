class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
     t.integer :review_id, null: false
     t.integer :user_id, null: false
     t.timestamps
   end

   add_index :votes, [:review_id, :user_id], unique: true
  end
end
