class AddAnnotationShowToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :annotation_show, :boolean
  end
end
