# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  cpf             :string(255)
#  birthdate       :date
#  phone_area_code :string(255)
#  phone_number    :string(255)
#  gender          :string(1)
#  picture         :string(255)
#  apartment_id    :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
