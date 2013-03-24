# == Schema Information
#
# Table name: building_communications
#
#  id               :integer          not null, primary key
#  building_id      :integer
#  communication_id :integer
#

class BuildingCommunication < ActiveRecord::Base
  attr_accessible :building, :communication

  belongs_to :building
  belongs_to :communication
end
