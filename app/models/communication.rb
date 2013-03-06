class Communication < ActiveRecord::Base
  attr_accessible :begin_date, :expiration_date, :message, :subject
end
