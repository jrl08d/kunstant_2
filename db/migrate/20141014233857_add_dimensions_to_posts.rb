class AddDimensionsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :dimension, :string
  end
end
