class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :users, :username, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
