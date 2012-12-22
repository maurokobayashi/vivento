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
#

class User < ActiveRecord::Base

  	attr_accessible :name, :email, :cpf, :birthdate, :phone_area_code, :phone_number, :password, :password_confirmation, :condo_id

  	belongs_to :condo

	has_secure_password
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email,
		presence: true,
		length: { maximum: 150 },
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	validates :password,
		presence: true,
		length: { minimum: 6 },
		:on => :create

	validates :password_confirmation,
		presence: true,
		:on => :create

	validates :condo_id,
		presence: true

	private
	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end

end
