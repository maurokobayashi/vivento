class CreateBuildingsCommunications < ActiveRecord::Migration
  def change
    create_table :buildings_communications, id: false do |t|
      t.belongs_to :building, index: true
      t.belongs_to :communication, index: true
    end
  end
end
