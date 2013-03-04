# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string(255)
#  number     :string(255)
#  complement :string(255)
#  district   :string(255)
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  zipcode    :string(255)
#  condo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base
  attr_accessible :condo_id, :city, :complement, :country, :district, :number, :state, :street, :zipcode

  belongs_to :condo
end
