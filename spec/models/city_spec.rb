# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'pp'


describe City do
#  before { @city = City.new(name: "Hometown")}

before do
    @city = City.new(name: "Hometown")
  end

  subject { @city}
   
   it { should respond_to(:name)}
   it { should respond_to (:venues)}
   it { should be_valid }





  describe "when name is not present" do
    before { @city.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @city.name = "a" * 26 }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      city_with_same_name = @city.dup
      city_with_same_name.name=@city.name.upcase
      city_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when city has numbers" do
  	before {@city.name = "1234"}
  	it {should_not be_valid}
  end 
  describe "city associations" do
    before {@city.save}
    

    let(:venue) { FactoryGirl.create(:venue, city: @city) }

    it "should destroy associated venues" do
        venues = @city.venues.dup
        pp @city 
        pp venues 
        @city.destroy
        venues.should_not be_empty
        venues.each do |venue|
          Venue.find_by_id(venue.id).should be_nil
        end
    end


  end
end
