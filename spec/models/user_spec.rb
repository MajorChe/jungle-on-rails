require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Validations" do
    it "password and confirm passoword should be the same" do
      @user = User.new(email: "a@a.com",password: "a",password_confirmation: "a")
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "password is required" do
      @user = User.new(email: "a@a.com",password: nil, first_name: "a", last_name: "b")
      expect(@user).to_not be_valid
    end

    it "emails must be unique" do
      @user1 = User.new(email: "a@a.COM", password: 'a', first_name: "a", last_name: "b")
      @user2 = User.new(email: "A@A.com", password: 'b', first_name: "a", last_name: "b")
      expect(@user2).to_not be_valid
    end

    it "password has a minimum length of 2" do
      @user = User.new(email: "a@a.com",password: '1', first_name: "a", last_name: "b")
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it ("should accept email and password as arguments in the login form") do
      @user1 = User.new(first_name: "a", last_name: "b", email: "a@a.com", password: "123", password_confirmation: "123")
      @user2 = User.authenticate_with_credentials("b@a.com", "123")
      expect(@user2).not_to eq(@user1)
    end

    it ("should not be case sensitive for email, all emails, to_lowercase.") do
      @user1 = User.new(first_name: "b", last_name: "d", email: "b@d.com", password: "123", password_confirmation: "123")
      @user1.save!
      @user2 = User.authenticate_with_credentials("b@d.com", "123")
      expect(@user2).to eq(@user1)
    end

    it ("should not be case sensitive for email, all emails, to_lowercase.") do
      @user1 = User.new(first_name: "c", last_name: "e", email: "abcd@xyz.com", password: "123", password_confirmation: "123")
      @user1.save!
      @user2 = User.authenticate_with_credentials("ABCD@XYZ.com", "123")
      expect(@user2).to eq(@user1)
    end
  end
end
