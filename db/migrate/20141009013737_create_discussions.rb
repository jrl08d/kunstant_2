class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.references :post, index: true
      t.text :comment

      t.timestamps
    end
  end
end
