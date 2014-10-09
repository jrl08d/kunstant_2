class Project < ActiveRecord::Base
  belongs_to :user
  has_many :milestones
  has_many :posts, dependent: :destroy		# corvo - Relates Posts to Projects and destroys dependencies upon deletion
end
