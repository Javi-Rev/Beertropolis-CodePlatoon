class BeersController < ApplicationController

  def index
    @beers = Beer.all
  end
  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def create
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :type, :manufacturer)
    end
end
