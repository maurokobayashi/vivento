# == Schema Information
#
# Table name: communications
#
#  id              :integer          not null, primary key
#  condo_id        :integer
#  subject         :string(255)
#  message         :string(255)
#  begin_date      :date
#  expiration_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Communication < ActiveRecord::Base

  has_and_belongs_to_many :buildings
  accepts_nested_attributes_for :buildings
end
