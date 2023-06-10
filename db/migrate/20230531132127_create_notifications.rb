class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :target_id, null: false
      t.string :sender, null: false
      t.integer :making_id
      t.integer :order_id
      t.integer :item_id
      t.integer :room_id
      t.string :action, default: "", null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end

    add_index :notifications, :target_id
    add_index :notifications, :making_id
    add_index :notifications, :order_id
    add_index :notifications, :room_id
  end
end
