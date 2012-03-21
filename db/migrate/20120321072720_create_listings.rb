class CreateListings < ActiveRecord::Migration
  def up
    create_table 'listings' do |t|
      t.string 'title'
      t.string 'description'
      t.integer 'rent'
      t.integer 'number_of_rooms'
      t.string 'utilities'
      t.string 'parking'
      t.string 'address'
    end
  end

  def down
    drop_table 'listings'
  end
end
