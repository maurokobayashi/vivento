class AddApartmentIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :apartment_id, :integer
  end
end
