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

    belongs_to :condo
    has_one :person
    has_one :facebook_account
    has_one :vivento_account

    before_save :create_remember_token

    validates :condo_id,
    :presence => true

    def has_facebook_account?
        facebook_account
    end

    def has_vivento_account?
        vivento_account
    end

    def facebook_id
        has_facebook_account? ? facebook_account.facebook_id : nil
    end

    private
    def create_remember_token
       self.remember_token = SecureRandom.urlsafe_base64
    end

end
