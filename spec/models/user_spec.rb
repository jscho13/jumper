require 'spec_helper'

describe User do
  it "validates for an incorrect password length" do
    user = User.new
    user.username = Faker::Internet.user_name
    user.email = Faker::Internet.email
    user.password = 'abc123'

    expect(user).to_not be_valid
    expect(user.errors.messages[:password]).to_not be_blank
  end

  it "validates for an correct password length" do
    user = User.new
    user.username = Faker::Internet.user_name
    user.email = Faker::Internet.email
    user.password = 'abc123abc'

    expect(user).to be_valid
    expect(user.errors.messages[:password]).to be_blank
  end

  it "validates for a non-unique username" do
    user = FactoryGirl.create(:user)
    begin
      user2 = FactoryGirl.create(:user)
    rescue
      expect(user2).to be_nil
    end
  end

  it "validates for a unique username" do
    user = User.new
    user.username = Faker::Internet.user_name
    user.email = Faker::Internet.email
    user.password = 'abc123abc'

    expect(user).to be_valid
  end

  it "validates for a non-unique email" do
    user = FactoryGirl.create(:user)
    begin
      user2 = FactoryGirl.create(:user)
    rescue
      expect(user2).to be_nil
    end
  end

  it "validates for a unique email" do
    user = User.new
    user.username = Faker::Internet.user_name
    user.email = Faker::Internet.email
    user.password = 'abc123abc'

    expect(user).to be_valid
  end
end
