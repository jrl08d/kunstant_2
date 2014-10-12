class Post < ActiveRecord::Base
  belongs_to :project
  has_many :discussions, dependent: :destroy		# corvo - Relates Discussions to Posts and destroys dependencies upon deletion
end
