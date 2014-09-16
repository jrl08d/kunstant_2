class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
   attr_accessor :recurring_rules
end
