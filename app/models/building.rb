# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  condo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Building < ActiveRecord::Base
  attr_accessible :condo_id, :name
end
