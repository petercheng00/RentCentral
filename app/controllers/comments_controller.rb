class CommentsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    if params[:comment][:author] == "" || params[:comment][:body] == ""
      redirect_to listing_path(@listing)
    else
      @comment = @listing.comments.create(params[:comment])
      @comment.post_time = Time.now
      @comment.save!
      redirect_to listing_path(@listing)
    end
  end
end
