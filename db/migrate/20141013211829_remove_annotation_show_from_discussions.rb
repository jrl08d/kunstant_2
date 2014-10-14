class RemoveAnnotationShowFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :annotation_show, :boolean
  end
end
