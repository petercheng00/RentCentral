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
    @listings = @listings.find_all{|l| l.is_public && l.is_active}
  end

  def show
    id = params[:id]
    @listing = Listing.find(id)
  end

  def new
  end

  def create
    if !signed_in?
      flash[:notice] = "You must be signed in to post a listing"
      redirect_to signin_path
    else
      listingParams = params[:listing]
      @listing = current_user.listings.create(listingParams)
      flash[:notice] = "Your listing has been created"
      redirect_to listing_path(@listing)
    end
  end

  def change_public
    @listing = Listing.find params[:id]
    @listing.is_public = !@listing.is_public
    @listing.save!
    redirect_to listing_path(@listing)
  end

  def change_active
    @listing = Listing.find params[:id]
    @listing.is_active = !@listing.is_active
    @listing.save!
    redirect_to listing_path(@listing)
  end

  def watch
    @listing = Listing.find params[:id]
    if !(@listing.watchers.include?(current_user))
      @listing.watchers << current_user
      @listing.save!
    end
    if !(current_user.watched_listings.include?(@listing))
      current_user.watched_listings << @listing
      current_user.save!
    end
    redirect_to listing_path(@listing)
  end

  def edit
    @listing = Listing.find params[:id]
  end

  def update
    @listing = Listing.find params[:id]
    if @listing.user.id != current_user.id
      redirect_to listings_path(@listing)
    else
      @listing.update_attributes!(params[:listing])
      flash[:notice] = "Your listing has been updated"
      redirect_to listings_path(@listing)
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    if @listing.user.id != current_user.id
      redirect_to listings_path
    else
      @listing.destroy
      flash[:notice] = "Your listing has been deleted"
      redirect_to listings_path
    end
  end
end
