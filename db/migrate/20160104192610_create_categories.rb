class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |table|
      table.string :category_name, null: false

      table.timestamps null: false
    end
  end
end
