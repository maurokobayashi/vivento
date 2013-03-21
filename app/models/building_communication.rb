class BuildingCommunication < ActiveRecord::Base
  attr_accessible :building, :communication

  belongs_to :building
  belongs_to :communication
end