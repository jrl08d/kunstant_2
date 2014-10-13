class Post < ActiveRecord::Base
  belongs_to :project
  has_many :discussions, dependent: :destroy		# corvo - Relates Discussions to Posts and destroys dependencies upon deletion

  # corvo - Added paperclip to Post ( for attaching files )
  has_attached_file :post_img 
  validates_attachment :post_img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  



end
