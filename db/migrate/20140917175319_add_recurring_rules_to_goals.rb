class AddRecurringRulesToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :recurring_rules, :text
  end
end
