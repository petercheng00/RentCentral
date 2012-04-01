class AddWatchers < ActiveRecord::Migration
  def up
    create_table :listings_users, :id => false do |t|
      t.integer :watched_listing_id
      t.integer :watcher_id
    end
  end

  def down
    drop_table :listings_users
  end
end
