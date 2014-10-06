class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :description
      t.string :title
      t.boolean :default
      t.references :user, index: true

      t.timestamps
    end
  end
end
