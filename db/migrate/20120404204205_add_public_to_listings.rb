class AddPublicToListings < ActiveRecord::Migration
  def up
    add_column :listings, :is_active, :boolean, :default => true
    add_column :listings, :is_public, :boolean, :default => true
  end

  def down
    remove_column :listings, :is_active
    remove_column :listings, :is_public
  end
end
