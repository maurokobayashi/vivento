# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  person_id  :integer
#  sent_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  attr_accessible :content, :person_id, :sent_at
  belongs_to :person
  validates :content, :length => {:maximum => 1000 }
end
