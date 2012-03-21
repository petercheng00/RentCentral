class CreateUsers < ActiveRecord::Migration
  def up
    create_table 'users' do |t|
      t.string 'name'
      t.string 'password'
      t.string 'email'
      t.string 'phone'
      t.string 'type'
    end
  end

  def down
    drop_table 'users'
  end
end
