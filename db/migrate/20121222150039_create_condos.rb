class CreateCondos < ActiveRecord::Migration
  def change
    create_table :condos do |t|
      t.string :code
      t.string :name
      t.string :website
      t.integer :address_id

      t.timestamps
    end
  end
end
