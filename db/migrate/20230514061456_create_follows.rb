class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :customer_id, null: false
      t.integer :creator_id, null: false
      t.timestamps
    end
  end
end
