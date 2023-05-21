class CreateMakings < ActiveRecord::Migration[6.1]

  def change
    create_table :makings do |t|
      t.integer :customer_id, null: false
      t.integer :creator_id, null: false
      t.integer :order_id
      t.string :color
      t.string :size
      t.string :genre
      t.string :style
      t.text :request, null: false
      t.integer :price, null: false
      t.integer :is_product, null: false, default: 0
      t.timestamps
    end
  end

end
