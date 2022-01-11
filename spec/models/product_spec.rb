require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it "product is not created" do
      @product = Product.new
      expect(@product).to be_valid
    end

    it "empty name is not valid" do
      @cat = Category.new(name: "test1")
      @cat.save
      @product = @cat.products.create({
        name:  nil,
        description: "test",
        quantity: 10,
        price: 50.43
      })
      expect(@product).to_not be_valid
    end

    it "empty price is not valid" do
      @cat = Category.new(name: "test1")
      @cat.save
      @product = @cat.products.create({
        name:  'Men\'s Classy shirt',
        description: "test",
        quantity: 10,
        price: nil
      })
      expect(@product).to_not be_valid
    end

    it "empty quantity is not valid" do
      @cat = Category.new(name: "test1")
      @cat.save
      @product = @cat.products.create({
        name:  'Men\'s Classy shirt',
        description: "test",
        quantity: nil,
        price: 64.99
      })
      expect(@product).to_not be_valid
    end

    it "empty category is not valid" do
      @cat = Category.new(name: "test1")
      @cat.save
      @product = @cat.products.create!({
        name:  'Men\'s Classy shirt',
        description: "test",
        quantity: 10,
        price: 64.99
      })
      @product.save
      expect(@product).to be_valid
    end
  end
end
