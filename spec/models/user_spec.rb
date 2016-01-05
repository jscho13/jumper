require 'spec_helper'

describe User do
  it "validates for an incorrect password length" do
    expect(FactoryGirl.build(:user, password: "abc123")).to_not be_valid
  end

  it "validates for an correct password length" do
    user = FactoryGirl.create(:user)

    expect(user).to be_valid
  end

  it "validates for a non-unique username" do
    FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user, username: "SayWhaaaaatttt5")).to_not be_valid
  end

  it "validates for a unique username" do
    user = FactoryGirl.create(:user)

    expect(user).to be_valid
  end

  it "validates for a non-unique email" do
    FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user, email: "faketestuser8@example.com")).to_not be_valid
  end

  it "validates for a unique email" do
    user = User.new
    user.username = Faker::Internet.user_name
    user.email = Faker::Internet.email
    user.password = 'abc123abc'

    expect(user).to be_valid
  end
end
