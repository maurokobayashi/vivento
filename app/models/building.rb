# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  condo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  floor_qty  :integer
#

class Building < ActiveRecord::Base

    belongs_to :condo
    has_many :apartments

    has_and_belongs_to_many :communications

    validates :name,
    presence: true,
    length: { maximum: 50 },
    uniqueness: { case_sensitive: false }

    validates :condo_id,
    presence: true

    validates :floor_qty,
    presence: true

end
