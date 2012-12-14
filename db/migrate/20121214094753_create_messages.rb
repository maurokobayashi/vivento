class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :person_id
      t.datetime :sent_at

      t.timestamps
    end
  end
end
