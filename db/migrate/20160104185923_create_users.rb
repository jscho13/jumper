class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :username, null: false
      table.string :first_name
      table.string :last_name
      table.string :email, null: false, unique: true

      table.timestamps null: false
    end
  end
end
