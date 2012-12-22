class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :number
      t.integer :floor
      t.integer :building_id

      t.timestamps
    end
  end
end
