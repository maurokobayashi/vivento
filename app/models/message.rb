class Message < ActiveRecord::Base
  attr_accessible :content, :person_id, :sent_at
  belongs_to :person
  validates :content, :length => {:maximum => 1000 }
end
