class ListingsController < ApplicationController
  def home
  end
  def index
    sort = params[:sort]
    case sort
    when 'rent'
      ordering = "rent ASC"
    when 'rooms'
      ordering = "number_of_rooms ASC"
    end
    if params[:minRent] == ""
      params[:minRent] = nil
    end
    if params[:maxRent] == ""
      params[:maxRent] = nil
    end
    if params[:minRooms] == ""
      params[:minRooms] = nil
    end
    if params[:maxRooms] == ""
      params[:maxRooms] = nil
    end
    minRent = params[:minRent] || -2147483647
    maxRent = params[:maxRent] || 2147483647
    minRooms = params[:minRooms] || -2147483647
    maxRooms = params[:maxRooms] || 2147483647
    @listings = Listing.find(:all, :conditions => ["rent > ? AND rent < ? AND number_of_rooms > ? AND number_of_rooms < ?", minRent, maxRent, minRooms, maxRooms], :order => ordering)
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
