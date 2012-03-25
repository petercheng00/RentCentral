class ListingsController < ApplicationController
  def home
  end
  def index
    @listings = Listing.all
  end

  def show
    id = params[:id]
    @listing = Listing.find(id)
  end

  def new
  end

  def create
    @listing = Listing.create!(params[:listing])
    flash[:notice] = "Your listing has been created"
    redirect_to listings_path
  end

  def edit
    @listing = Listing.find params[:id]
  end

  def update
    @listing = Listing.find params[:id]
    @listing.update_attributes!(params[:listing])
    flash[:notice] = "Your listing has been updated"
    redirect_to listings_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Your listing has been deleted"
    redirect_to listings_path
  end
end
