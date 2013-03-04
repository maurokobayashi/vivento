# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  cpf             :string(255)
#  birthdate       :date
#  phone_area_code :string(255)
#  phone_number    :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  condo_id        :integer
#  apartment_id    :integer
#  facebook_id     :integer
#  admin           :boolean          default(FALSE)
#  picture         :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
