class AddAnnotationToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :annotation, :text
  end
end
