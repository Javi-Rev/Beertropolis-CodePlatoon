class BeersController < ApplicationController

  def index
    @beers = Beer.where(["name like ?", "%#{params['filter']}%"])
  end

  def show
    @beer = Beer.find(params[:id])
    @reviews = @beer.reviews.order(:created_at)
    @last_transaction_date =               @reviews.last.transaction_date
    @total_transactions =                  @reviews.count
    @last_transaction_price =              @reviews.last.price
    @last_30_days_reviews_avg =            last_30_days_reviews_avg
    @last_90_days_reviews_avg =            last_90_days_reviews_avg
    @last_30_days_reviews_percent_change = last_30_days_reviews_percent_change
    @avg_reviews_rating =                  avg_reviews_rating

    gon.latLong = @reviews.map do |review|
      {latitude: review.latitude, longitude: review.longitude}
    end

    gon.reviewDates = @reviews.pluck(:created_at)
    gon.reviewPrices = @reviews.pluck(:price)
  end

  def new
    @beer = Beer.new
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      redirect_to @beer
    else
      render 'new'
    end
  end

  def update
    @beer = Beer.find(params[:id])

    if @beer.update(beer_params)
      redirect_to @beer
    else
      render 'edit'
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    redirect_to beers_path
  end

  def last_30_days_reviews_avg
    sum = 0
    last_30_days_reviews = @reviews.where("created_at > ?", 30.days.ago)
    last_30_days_reviews.each do |review|
      sum += review.price.round(2)
    end
    sum / last_30_days_reviews.count
  end

  def last_90_days_reviews_avg
    sum = 0
    last_90_days_reviews = @reviews.where("created_at > ?", 90.days.ago)
    last_90_days_reviews.each do |review|
      sum += review.price.round(2)
    end
    sum / last_90_days_reviews.count
  end

  def last_30_days_reviews_percent_change
    prices = []
    last_30_days_reviews = @reviews.where("created_at > ?", 30.days.ago)
    last_30_days_reviews.each do |review|
      prices << review.price.round(2)
    end
    (((prices.max - prices.min) / prices.min) * 100).round(2).to_s + '%'
  end

  def avg_reviews_rating
    sum = 0
    @reviews.each do |review|
      sum += review.rating
    end
    (sum / @reviews.count).round(1).to_s + ' stars'
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :type, :manufacturer)
  end
end
