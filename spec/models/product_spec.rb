require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    subject {
      @cat = Category.new(name: "test1")
      @cat.save
      @product = @cat.products.create({
        name:  "lighter",
        description: "test",
        quantity: 10,
        price: 50.43
      })
    }
    it "product is not created" do
      @product = Product.new
      expect(@product).to_not be_valid
    end

    it "empty name is not valid" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "empty price is not valid" do
      subject.price = "a"
      expect(subject).to_not be_valid
    end

    it "empty quantity is not valid" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "empty category is not valid" do
      @cat = Category.new(name: "test1")
      @cat.save
      @product = @cat.products.create({
        name:  "lighter",
        description: "test",
        quantity: 10,
        price: 50.43
      })
      expect(@product).to be_valid
    end
  end
end
