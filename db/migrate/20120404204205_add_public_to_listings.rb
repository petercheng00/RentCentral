class AddPublicToListings < ActiveRecord::Migration
  def up
    add_column :listings, :is_active, :boolean, :default => 1
    add_column :listings, :is_public, :boolean, :default => 1
  end

  def down
    remove_column :listings, :is_active
    remove_column :listings, :is_public
  end
end
