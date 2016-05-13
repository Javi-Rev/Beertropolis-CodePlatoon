class WelcomeController < ApplicationController
  def index
    @beers = Beer.all
    @beerarr = []
    @beers.each do |beer|
      @beerarr << beer.name
    end
    gon.Beers = @beerarr
  end

end
