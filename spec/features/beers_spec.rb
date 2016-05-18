require 'rails_helper'
require 'spec_helper'

RSpec.describe "Beers views", :type => :feature do
  scenario "User wants to view all beers" do

    Beer.create!(manufacturer: "Anheiseur Busch", name: "Zombie Dust")

    visit beers_path
    assert page.has_content?('Anheiseur Busch')
    assert page.has_content?('Zombie Dust')

    click_on 'Zombie Dust'
    assert page.has_content?('Reviews')
  end
end
