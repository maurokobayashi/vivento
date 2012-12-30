class AddFloorQtyToBuildings < ActiveRecord::Migration
  def change
            add_column :buildings, :floor_qty, :integer
  end
end
