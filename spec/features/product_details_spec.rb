require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature,js: true do

  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "See the product's details" do
    visit root_path
    click_link("Details", match: :first)
    puts page.html
    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_css 'section.products-show'
  end
end
