require 'test_helper'

class ReviewsTest < ActionDispatch::IntegrationTest

  def test_there_are_reviews_on_the_individual_show_page_for_a_single_beer
    beer = Beer.create!(name: 'Zombie Dust', style: 'Ale', manufacturer: 'Three Floyds')

    page.visit root_path
    assert root_path, page.current_path
    assert page.has_content?('Zombie Dust')

    page.click_link('Zombie Dust')
    page.visit show_path
    assert show_path, page.current_path
    assert page.has_content?('Reviews')
  end

  def test_i_can_create_a_beer_review
    beer = Beer.create!(name: 'Alpha King', style: 'Lager', manufacturer: 'Hateful')
    require "pry"
    binding.pry

    page.visit beer_path
    assert page.has_content?('Add Review')
    page.click_link('Add Review')
    fill_in('title', :with => 'Awesome')
    fill_in('body', :with => 'I love this beer')
    fill_in('price', :with => 25.00)
    fill_in('zip code', :with => 60604)
    fill_in('rating', :with => 5)
    page.click_button('Submit')

    assert beer_path, page.current_path
    assert page.has_content?('Awesome')
    assert page.has_content?('I love this beer')
    assert page.has_content?(60604)
  end
end
