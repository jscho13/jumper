require 'spec_helper'

describe Venue do

  it { should have_many :reviews }
  it { should belong_to :user }

  describe "venue_name validations" do
    subject { FactoryGirl.build(:venue) }
    it { should validate_presence_of(:venue_name) }
  end

  describe "street_name validations" do
    subject { FactoryGirl.build(:venue) }
    it { should validate_presence_of(:street_name) }
  end

  describe "state validations" do
    subject { FactoryGirl.build(:venue) }
    it { should validate_presence_of(:state) }
    it { should validate_inclusion_of(:state).in_array(Venue::STATES) }
  end

  describe "zip_code validations" do
    subject { FactoryGirl.build(:venue) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_length_of(:zip_code).is_equal_to(5) }
    it { should validate_numericality_of(:zip_code).only_integer }
  end

  describe "city validations" do
    subject { FactoryGirl.build(:venue) }
    it { should validate_presence_of(:city) }
  end

  describe "user validations" do
    subject { FactoryGirl.build(:venue) }
    it { should validate_presence_of(:user) }
  end
end
