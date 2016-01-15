require 'spec_helper'

describe Review do

  it { should have_many :votes }
  it { should belong_to :user }
  it { should belong_to :venue }

  describe "rating validations" do
    subject { FactoryGirl.build(:review) }
    it { should validate_presence_of(:rating) }
    it { should validate_numericality_of(:rating).only_integer }
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
  end

  describe "venue_id validations" do
    subject { FactoryGirl.build(:review) }
    it { should validate_presence_of(:venue_id) }
  end

  describe "user validations" do
    subject { FactoryGirl.build(:review) }
    it { should validate_presence_of(:user) }
  end
end
