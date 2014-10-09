class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.text :description
      t.references :project, index: true

      t.timestamps
    end
  end
end
