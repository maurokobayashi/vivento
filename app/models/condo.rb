# == Schema Information
#
# Table name: condos
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  website    :string(255)
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Condo < ActiveRecord::Base
  attr_accessible :code, :name, :website

  has_many :buildings
  has_many :users
  has_one :address
end
