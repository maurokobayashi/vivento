# == Schema Information
#
# Table name: communications
#
#  id              :integer          not null, primary key
#  subject         :string(255)
#  message         :string(255)
#  begin_date      :date
#  expiration_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Communication < ActiveRecord::Base
  attr_accessible :begin_date, :expiration_date, :message, :subject

  has_many :condo_communications
  has_many :condos, :through => :condo_communications #relashionship

  has_many :building_communications
  has_many :buildings, :through => :building_communications #relashionship
end
