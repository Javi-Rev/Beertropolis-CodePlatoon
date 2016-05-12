class SearchController < ApplicationController
def index
    @look = ThingSearch.new(search_params)
    @search = search_params.present? ? @look.results : Search.all
  end

  def typehead
    @look = SearchSearch.new(typeahead: params[:query])
    render json: @look.results
  end

  private

  def search_params
    params[:thing_search] || {}
  end
end
