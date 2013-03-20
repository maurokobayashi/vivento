class Communication < ActiveRecord::Base
  attr_accessible :begin_date, :expiration_date, :message, :subject

  has_many :condo_communications
  has_many :condos, :through => :condo_communications #relashionship

  has_many :building_communications
  has_many :buildings, :through => :building_communications #relashionship
end
