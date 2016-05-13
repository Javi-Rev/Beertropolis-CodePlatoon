class WelcomeController < ApplicationController
  def index
    beers = Beer.all
    typeahead_data = []
    typeahead_names = []
    beers.each do |beer|
      typeahead_data << {id: beer.id, name: beer.name}
      typeahead_names << beer.name
    end
    gon.Beers = typeahead_data
    gon.Names = typeahead_names
  end
end
