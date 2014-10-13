class Post < ActiveRecord::Base
  belongs_to :project
  
  # corvo - Validates presence of both text and post image
  validates :post_text, presence: true
  validates :post_img, presence: true

  # corvo - Relates Discussions to Posts and destroys dependencies upon deletion
  has_many :discussions, dependent: :destroy		

  # corvo - Added paperclip to Post ( for attaching files ), beneath, conditionals
  has_attached_file :post_img, :styles => { :small => "150x150>",
  											:medium => "400x400>",
  											:large => "800x800>"} #,
  					# :url => "/assets/posts/:id/:style/:basename.:extension",
  					# :path => ":rails_root/:public/assets/posts/:id/:style/:basename.:extension"

  # corvo - validations in size and kind
  validates_attachment :post_img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_with AttachmentSizeValidator, :attributes => :post_img, :less_than => 1.megabytes

end
