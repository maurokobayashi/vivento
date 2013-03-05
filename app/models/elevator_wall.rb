# == Schema Information
#
# Table name: elevator_walls
#
#  id              :integer          not null, primary key
#  subject         :string(255)
#  communication   :string(255)
#  creation_date   :date
#  creation_time   :time
#  expiration_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ElevatorWall < ActiveRecord::Base
  attr_accessible :communication, :creation_date, :creation_time, :expiration_date, :subject
end
