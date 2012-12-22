# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  number      :string(255)
#  floor       :integer
#  building_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Apartment do
  pending "add some examples to (or delete) #{__FILE__}"
end
