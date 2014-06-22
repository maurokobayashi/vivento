class CreateViventoAccounts < ActiveRecord::Migration
  def change
    create_table :vivento_accounts do |t|
      t.string :email
      t.string :password_digest
      t.integer :user_id

      t.timestamps
    end
  end
end
