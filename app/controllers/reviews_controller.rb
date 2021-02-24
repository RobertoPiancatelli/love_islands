class ReviewsController < ApplicationController

  def create
    @island = Island.find(params[:id])
    @review = Review.new(review_params)
    @review.island = @island
    @island.user = current_user
    if @review.save
      redirect_to island_path(@island)
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
