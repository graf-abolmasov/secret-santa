class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :url, :string
    add_column :users, :vkid, :string
    add_column :users, :photo_url, :string
  end
end
