# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  condo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  floor_qty  :integer
#

require 'spec_helper'

describe Building do
  pending "add some examples to (or delete) #{__FILE__}"
end
