class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :room_id, null: false
      t.string :sender, null: false
      t.text :letter
      t.timestamps
    end
  end
end
