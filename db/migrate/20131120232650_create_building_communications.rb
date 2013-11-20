class CreateBuildingCommunications < ActiveRecord::Migration
  def change
    create_table :building_communications do |t|
      t.integer :building_id
      t.integer :communication_id
    end
  end
end
