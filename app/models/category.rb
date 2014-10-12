class Category < ActiveRecord::Base
	has_many :goals
	has_many :projects
	accepts_nested_attributes_for :goals
	accepts_nested_attributes_for :projects
end
