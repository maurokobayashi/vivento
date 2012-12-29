# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  number      :string(255)
#  floor       :integer
#  building_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Apartment < ActiveRecord::Base
  attr_accessible :building_id, :floor, :number

  belongs_to :building
  belongs_to :user
end
