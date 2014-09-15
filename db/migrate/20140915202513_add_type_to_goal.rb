class AddTypeToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :type, :integer
  end
end
