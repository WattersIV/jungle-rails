require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    category = Category.new
    product = Product.new  
    
    it 'Wont save with empty name' do 
      product.price = 100 
      product.quantity = 1 
      product.category_id = 1
      expect(product).to_not be_valid
    end

    it 'Wont save with empty price' do 
      product.name = 'Blamo' 
      product.quantity = 1 
      product.category_id = 1
      expect(product).to_not be_valid
    end

    it 'Wont save with empty quantity' do 
      product.price = 100 
      product.name = 'Jamo' 
      product.category_id = 1
      expect(product).to_not be_valid
    end

    it 'Wont save with empty category' do 
      product.price = 100 
      product.quantity = 1 
      product.name = 'Slamo'
      expect(product).to_not be_valid
    end
  end
end