# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  number      :string(255)
#  floor       :integer
#  building_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Apartment < ActiveRecord::Base

    belongs_to :building
    has_many :people

    def number_with_building
        "#{self.building.name} - Apto #{number}"
    end
end
