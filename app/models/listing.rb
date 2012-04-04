class Listing < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :watchers, :class_name => "User", :foreign_key => "watched_listing_id", :association_foreign_key => "watcher_id"
  has_many :comments
end
