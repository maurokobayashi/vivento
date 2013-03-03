class CreateElevatorWalls < ActiveRecord::Migration
  def change
    create_table :elevator_walls do |t|
      t.string :subject
      t.string :communication
      t.date :creation_date
      t.time :creation_time
      t.date :expiration_date

      t.timestamps
    end
  end
end
