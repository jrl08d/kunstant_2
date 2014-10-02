class Category < ActiveRecord::Base
	has_many :goals
	accepts_nested_attributes_for :goals
end
