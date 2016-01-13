class AddColumnVotes < ActiveRecord::Migration
  def change
    add_column :votes, :up, :boolean, default: false, null: false
  end
end
