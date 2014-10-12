class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :project, index: true
      t.text :post_text

      t.timestamps
    end
  end
end
