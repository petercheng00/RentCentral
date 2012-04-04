class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :body
      t.string :author
      t.integer :listing_id
      t.datetime :post_time
    end
  end
  def down
    drop_table :comments
  end
end
