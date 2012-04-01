class ChangeListingDescriptionToText < ActiveRecord::Migration
  def up
    change_table :listings do |t|
      t.change :description, :text
    end
  end

  def down
    change_table :listings do |t|
      t.change :description, :string
    end
  end
end
