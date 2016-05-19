require 'rails_helper'
require 'spec_helper'

RSpec.describe "Page headers and footers are operable", :type => :feature do

  scenario "User wants to navigate the site using the header" do
    visit root_path
    assert page.has_content?('Beertropolis')
    assert page.has_content?('Beers')

    click_on 'Beertropolis'
    assert page.has_content?('Beers')

    click_on 'Beers'
    assert page.has_content?('All Beers')
    assert page.has_content?('Beertropolis')

    click_on 'Beertropolis'
    assert page.has_content?('About Us')
    click_on 'About Us'

    assert page.has_content?('Javi')
    assert page.has_content?('Contact Us!')
  end
end
