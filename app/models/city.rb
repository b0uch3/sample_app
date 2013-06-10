# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base
  attr_accessible :name
  before_save { |city| city.name = name.downcase }
  VALID_CITY_REGEX = /^[a-zA-Z]+$/
  validates :name, presence: true, length: { maximum: 25 }, format: { with: VALID_CITY_REGEX },
                    uniqueness: { case_sensitive: false}
  

end
