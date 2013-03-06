class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.string :subject
      t.communication :message
      t.date :begin_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
