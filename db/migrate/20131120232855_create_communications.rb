class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.date :begin_date
      t.date :expiration_date
      t.string :message
      t.string :subject
      t.integer :building_id
    end
  end
end
