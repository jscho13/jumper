require 'spec_helper'

describe Vote do

  it { should belong_to :review }
  it { should belong_to :user }

  describe "review validations" do
    review { FactoryGirl.build(:review) }
    user { FactoryGirl.build(:user) }
    subject { Vote.new(review: review, user: user, review_id: review_id) }
    it { should validate_presence_of(:review) }
  end

  describe "user validations" do
    review { FactoryGirl.build(:review) }
    user { FactoryGirl.build(:user) }
    subject { Vote.new(review: review, user: user, review_id: review_id) }
    it { should validate_presence_of(:user) }
  end

  describe "review_id validations" do
    review { FactoryGirl.build(:review) }
    user { FactoryGirl.build(:user) }
    subject { Vote.new(review: review, user: user, review_id: review_id) }
    it { should validate_uniqueness_of(:review_id).scoped_to(:user_id) }
    it { should validate_uniqueness_of(:review_id).failure_message_preface("already voted") }
  end
end
