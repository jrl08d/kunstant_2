class RemoveDimensionsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :dimension, :string
  end
end
