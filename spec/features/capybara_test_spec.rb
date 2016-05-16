require 'rails_helper'

RSpec.describe 'Database cleaner test (making sure it works before you go writing tests)', type: :feature, js: true do
  it 'works with capybara' do
    page.visit beers_path
    refute page.has_content?("Zombie Killer")

    Beer.create!(name: "Zombie Killer", manufacturer: "Three Floydzzzzzzzzz")

    page.visit beers_path
    assert page.has_content?("Zombie Killer")
  end
end
