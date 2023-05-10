class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :creator_id, null: false
      t.integer :star
      t.string :comment
      t.timestamps
    end
  end
end
