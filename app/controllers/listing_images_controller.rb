class ListingImagesController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    if !params[:listing_image][:photo]
      redirect_to listing_path(@listing)
    else
      @listing_image = @listing.listing_images.create!(params[:listing_image])
      redirect_to listing_path(@listing)
    end
  end

end
