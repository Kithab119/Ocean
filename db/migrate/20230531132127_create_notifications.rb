class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :customer_id
      t.integer :creator_id
      t.integer :room_id
      t.string :action, default: "", null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end

    add_index :notifications, :customer_id
    add_index :notifications, :creator_id
    add_index :notifications, :room_id
  end
end
