class Person < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :messages
  validates :name, :length => {:maximum => 100 }
end
