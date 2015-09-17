class CreateCommunication < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.date :begin_date
      t.date :expiration_date
      t.string :message
      t.string :subject
      t.integer :building_id

      t.timestamps
    end
    add_index :communications, :begin_date
    add_index :communications, :expiration_date
  end
end
