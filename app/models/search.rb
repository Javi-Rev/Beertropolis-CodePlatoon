class Search < ActiveRecord::Base
  attr_accessible :name
  after_save :write_json
end

def write_json
  beers_json = []
  Beer.all.each do |beer|
    beer_json = {
      "name" => beer.name
    }
  end
  beers_json << beer_json
  File.open("db/beers.json","w") do |f|
    f.write(beer_json.to_json)
  end
end
