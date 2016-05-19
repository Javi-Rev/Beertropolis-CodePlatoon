require 'rails_helper'
require 'spec_helper'

RSpec.describe "Beers views", :type => :feature do
  scenario "User wants to view all beers" do

    beer = Beer.create!(manufacturer: "Anheiser Busch", name: "Zombie Dust")
    review = beer.reviews.create!(price: 56, body: "hello", rating: 4)

    visit beers_path
    assert page.has_content?('Anheiser Busch')
    assert page.has_content?('Zombie Dust')

    click_on 'Zombie Dust'
    assert page.has_content?('Reviews')
  end
end
