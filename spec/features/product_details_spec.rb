require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
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
  scenario "users can navigate from the home page to the product detail page" do
    #Act 
    visit root_path
    first('.pull-right').click 

    #Debug 
    save_and_open_screenshot 'product.jpeg'

    #Verify 
    expect(page).to have_content(@category.products.first.name)
  end
end
