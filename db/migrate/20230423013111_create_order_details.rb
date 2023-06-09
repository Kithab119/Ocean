class CreateOrderDetails < ActiveRecord::Migration[6.1]

  def change
    create_table :order_details do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :purchase, null: false
      t.integer :is_sent, null: false, default: 0
      t.timestamps
    end
  end

end
