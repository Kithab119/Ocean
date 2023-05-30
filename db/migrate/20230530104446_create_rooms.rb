class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :making_id, null: false
      t.timestamps
    end
  end
end
