require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Validations" do
    it "password and confirm passoword should be the same" do
      @user = User.create(email: "a@a.com",password: "a",password_confirmation: "a")
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "password is required" do
      @user = User.create(email: "a@a.com",password: nil, first_name: "a", last_name: "b")
      expect(@user).to_not be_valid
    end

    it "emails must be unique" do
      @user1 = User.create(email: "a@a.COM", password: 'a', first_name: "a", last_name: "b")
      @user2 = User.create(email: "A@A.com", password: 'b', first_name: "a", last_name: "b")
      expect(@user2).to_not be_valid
    end

    it "password has a minimum length of 2" do
      @user = User.create(email: "a@a.com",password: '1', first_name: "a", last_name: "b")
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    
  end
end
