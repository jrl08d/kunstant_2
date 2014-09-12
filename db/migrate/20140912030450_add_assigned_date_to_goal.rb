class AddAssignedDateToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :assigned_date, :date
  end
end
