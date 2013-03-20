class CondoCommunication < ActiveRecord::Base
  
  attr_accessible :condo, :communication

  belongs_to :condo
  belongs_to :communication
end