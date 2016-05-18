require 'rails_helper'
require 'spec_helper'

RSpec.describe "Page headers and footers are operable", :type => :feature do

  scenario "User wants to navigate the site using the header" do
    visit root_path
    assert page.has_content?('Home')
    assert page.has_content?('Beers')

    click_on 'Home'
    assert page.has_content?('Be a part of the craft beer revolution')
    assert page.has_content?('Beers')

    click_on 'Beers'
    assert page.has_content?('All Beers')
    assert page.has_content?('Home')

    click_on 'Home'
    # assert page.has_content?('About Us')
    # click_on 'About Us'

    assert page.has_content?('Javi')
    assert page.has_content?('JMMS@beertropolis.com')
  end
end
