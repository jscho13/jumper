class AddConstraintsToUsername < ActiveRecord::Migration
  def change
    change_column_null :users, :username, false
    add_index :users, :username, unique: true
  end
end
