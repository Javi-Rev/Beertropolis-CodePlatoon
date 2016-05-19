require 'rails_helper'

RSpec.describe "Review", :type => :feature do
  def assert_there_are_reviews
    scenario "Leave a Review" do
      visit beer_path(71)
      assert page.has_content?('Reviews')
    end
  end

  def assert_I_can_make_a_review
    assert page.has_content?('Leave a Review')
    click_on 'Leave a Review'

    feature "Review" do
      let(:name) {'Pliny the Elder'}
      let(:price) {'1.00'}
      let(:review) {'beer review'}
    end
  end


end

