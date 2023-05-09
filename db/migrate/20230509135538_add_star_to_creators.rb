class AddStarToCreators < ActiveRecord::Migration[6.1]
  def change
    add_column :creators, :star, :string
  end
end
