# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  condo_id        :integer
#  facebook_id     :integer
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base

  	attr_accessible :email, :password, :password_confirmation, :condo_id, :facebook_id

  	belongs_to :condo
  	has_one :person

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	has_secure_password unless :facebook_id?
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email,
	:presence => true,
	:length => { :maximum => 150 },
	:format => { :with => VALID_EMAIL_REGEX },
	:uniqueness => { :case_sensitive => false },
	:unless => :you_are_mauro_or_danillo

	validates :password,
	:presence => true,
	:length => { :minimum => 6 },
	:unless => :facebook_id?,
	:on => :create

	validates :password_confirmation,
	:presence => true,
	:unless => :facebook_id?,
	:on => :create

	validates :condo_id,
	:presence => true

	validates :facebook_id,
	:uniqueness => true,
	:unless => :you_are_mauro_or_danillo

	private
		def you_are_mauro_or_danillo
			email == 'mauro.kobayashi@gmail.com' || email == 'danillo.fs@gmail.com'
		end

	def has_facebook?
		!self.facebook_id.nil?
	end

	private
	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end

end
