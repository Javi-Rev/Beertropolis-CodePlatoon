require 'rails_helper'
require 'spec_helper'

RSpec.describe "Page headers and footers are operable", :type => :feature do
  
  scenario "User wants to go to the home page" do
    visit root_path
    assert page.has_content?('Home')
    click_on 'Home'

    assert page.has_content?('Be a part of the craft beer revolution')
  end

  scenario "User wants to go to the beer list" do
    assert page.has_content?('Beers')
    click_on 'Beers'

    assert page.has_content?('All Beers')
  end

  scenario "User wants to know about the company" do
  assert page.has_content?('About Us')
  click_on 'About Us'

  assert page.has_content?('Javi')
  end

  scenario "User wants to contact us" do
    assert page.has_content?('JMMS@beertropolis.com')
    click_on 'JMMS@beertropolis.com'
  end

end
