class Listing < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :watchers, :class_name => "User", :foreign_key => "watched_listing_id", :association_foreign_key => "watcher_id"
  has_many :comments
  has_many :listing_images, :dependent => :destroy

  accepts_nested_attributes_for :listing_images
end
