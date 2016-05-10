class ApiController < ApplicationController
  
  def beers
    render json: Beer.all
  end

 
end
