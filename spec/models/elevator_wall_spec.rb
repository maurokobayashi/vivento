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

require 'spec_helper'

describe ElevatorWall do
  pending "add some examples to (or delete) #{__FILE__}"
end
