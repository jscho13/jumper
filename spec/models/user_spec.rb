require 'spec_helper'

describe User do
  describe "email validations" do
    subject { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "username validations" do
    subject { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:username) }
  end

  it "validates for an incorrect password length" do
    expect(FactoryGirl.build(:user, password: "abc123")).to_not be_valid
  end

  it "validates for an correct password length" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end
end
