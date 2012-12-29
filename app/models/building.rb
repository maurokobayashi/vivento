# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  condo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Building < ActiveRecord::Base

    attr_accessible :condo_id, :name

    belongs_to :condo
    has_many :apartments

    validates :name,
    presence: true,
    length: { maximum: 50 },
    uniqueness: { case_sensitive: false }

    validates :condo_id,
    presence: true

end
