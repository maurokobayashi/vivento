# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  cpf             :string(255)
#  birthdate       :date
#  phone_area_code :string(255)
#  phone_number    :string(255)
#  gender          :string(1)
#  picture         :string(255)
#  apartment_id    :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Person < ActiveRecord::Base

    mount_uploader :picture, PictureUploader
    attr_accessible :name, :email, :cpf, :birthdate, :gender, :phone_area_code, :phone_number, :picture, :apartment_id, :user_id

    has_many :messages
    belongs_to :user
    belongs_to :apartment

    validates :name,
    presence: true

    validates :name,
    :length => {:maximum => 100 }

    validates :email,
    presence: true

    validates :cpf,
    presence: true

    validates :birthdate,
    presence: true

    validates :gender,
    presence: true

    validates :phone_area_code,
    presence: true

    validates :phone_number,
    presence: true

    validates :apartment_id,
    presence: true

    validates :user_id,
    presence: true

    def is_admin?
        self.user.nil? ? false : self.user.admin?
    end

    def has_facebook_account?
        user.has_facebook_account?
    end
end
