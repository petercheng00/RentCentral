class AddSaltToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    rename_column :users, :password, :encrypted_password
  end

  def self.down
    remove_column :users, :salt
    rename_column :users, :encrypted_password, :password
  end
end
