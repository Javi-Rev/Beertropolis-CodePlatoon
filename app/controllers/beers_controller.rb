class BeersController < ApplicationController
  def show
    @beer = Beer.find(params[:id])
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :type, :manufacturer)
    end
end
