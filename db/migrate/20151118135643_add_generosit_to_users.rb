class AddGenerositToUsers < ActiveRecord::Migration
  def change
    add_column :users, :generosity, :integer, default: 1500
  end
end
