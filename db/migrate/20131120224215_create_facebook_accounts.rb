class CreateFacebookAccounts < ActiveRecord::Migration
  def change
    create_table :facebook_accounts do |t|
      
      t.integer :facebook_id
      t.string :access_token
      t.integer :user_id

      t.timestamps
    end
  end
end
