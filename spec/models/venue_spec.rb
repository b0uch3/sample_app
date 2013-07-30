# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'



describe Venue do
   let(:city) { FactoryGirl.create(:city) }
   before { @venue = city.venues.build(name: "The Elmdale Tavern")}
   subject { @venue}

  it { should respond_to(:name) }
  it { should respond_to(:city_id) }
  its(:city)  { should == city}
  describe "accessible attributes" do
    it "should not allow access to city_id" do
      expect do
        Venue.new(city_id: city.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when city_id is not present" do
    before { @venue.city_id = nil }
    it { should_not be_valid }
  end

end
