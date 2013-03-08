# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  condo_id       :integer          not null
#  admin          :boolean          default(FALSE)
#  remember_token :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ActiveRecord::Base

  	attr_accessible :condo_id

  	belongs_to :condo
  	has_one :person
  	has_one :facebook_account
  	has_one :vivento_account

	before_save :create_remember_token

	validates :condo_id,
	:presence => true

	def has_facebook_account?
		!facebook_account.nil?
	end

    def has_vivento_account?
        !vivento_account.nil?
    end

    def facebook_id
        has_facebook_account? ? facebook_account.facebook_id : nil
    end

    def email
        has_vivento_account? ? vivento_account.email : nil
    end

	private
	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end

end
