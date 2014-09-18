class Goal < ActiveRecord::Base
  include IceCube
  belongs_to :user
  belongs_to :category

  def occurrences(up_to_date)
    if self.recurring_rules
      IceCube::Schedule.new(now = Time.now) do |s|
        s.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.recurring_rules))
      end.occurrences(up_to_date)
    else
      [self.assigned_date]
    end
  end
end
