class ListingImage < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :photo, :styles => { :small => "200x200" }
end
