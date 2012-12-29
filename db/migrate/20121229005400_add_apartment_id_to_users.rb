class AddApartmentIdToUsers < ActiveRecord::Migration
  def change
        add_column :users, :apartment_id, :integer
  end
end
