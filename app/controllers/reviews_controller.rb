class ReviewsController < ApplicationController

  def index

  end

  def create
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.create(review_params)
    if @review.save
      redirect_to beer_path(@beer)
    else
      render 'new'
    end
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.find(params[:id])
    @review.destroy

    redirect_to beer_path(@beer)
  end

  private
    def review_params
      params.permit(:beer_id, :manufacturer, :name, :location, :price, :rating, :body, :latlong)
    end
end
