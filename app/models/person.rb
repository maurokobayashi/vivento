# == Schema Information
#
# Table name: people
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  email        :string(255)      not null
#  picture      :string(255)
#  apartment_id :integer
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Person < ActiveRecord::Base

    mount_uploader :picture, PictureUploader
    attr_accessible :name, :email, :picture, :apartment_id, :user_id

    has_many :messages
    belongs_to :user
    belongs_to :apartment

    validates :name,
    presence: true

    validates :name,
    :length => {:maximum => 100 }

    validates :email,
    presence: true

    validates :apartment_id,
    presence: true

    validates :user_id,
    presence: true

    def build_timeline
        # timeline = []
        #building.communications.sort!(&:created_at)
        # (timeline.push communications).sort! { |b,a| a.created_at <=> b.created_at }
        building.communications.sort! { |b,a| a.created_at <=> b.created_at }

    end

    def admin?
        user.nil? ? false : user.admin?
    end

    def has_facebook_account?
        user.nil? ? false : user.has_facebook_account?
    end

    def has_vivento_account?
        user.nil? ? false : user.has_vivento_acount?
    end

    def facebook_id
        user.nil? ? nil : user.facebook_id
    end

    def building
        apartment.building
    end

end
