require '../test_helper'

class ReviewsTest < ActionDispatch::IntegrationTest

  def test_there_are_reviews_on_the_individual_show_page_for_a_single_beer
    beer = Beer.create!(id: 1, name: 'Zombie Dust', style: 'Ale', manufacturer: 'Three Floyds')

    page.visit root_path
    assert root_path, page.current_path
    assert page.has_content?('Zombie Dust')

    page.click_link('Zombie Dust')
    # page.visit beer_path
    assert_equal beer_path(beer), page.current_path
    assert page.has_content?('Reviews')
  end

  def test_i_can_create_a_beer_review_and_edit_and_delete_it_too
    beer = Beer.create!(id: 2, name: 'Alpha King', style: 'Lager', manufacturer: 'Hateful')

    page.visit beer_path(id: 2)
    assert page.has_content?('Reviews')
    page.click_button('Create Review')
    fill_in('Name', :with => 'Awesome')
    fill_in('Price', :with => 25.00)
    fill_in('Location', :with => 60604)
    fill_in('Rating', :with => 5)
    page.click_button('Create Review')

    assert beer_path(id: 2), page.current_path
    assert page.has_content?('Awesome')
    assert page.has_content?(60604)

    assert page.has_content?('Edit')
    page.click_link('Edit')
    fill_in('name', :with => 'edited name')
    page.click_button('Submit')
    assert page.has_content?('edited name')

    assert page.has_content?('Delete')
    page.click_link('Delete')
    refute page.has_content?('edited name')
  end
  
end
