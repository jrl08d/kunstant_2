class Post < ActiveRecord::Base
  belongs_to :project
  after_create :order_post
  after_destroy :reorder_post
  
  # corvo - Validates presence of both text and post image
  validates :post_text, presence: true
  validates :post_img, presence: true

  # corvo - Relates Discussions to Posts and destroys dependencies upon deletion
  has_many :discussions, dependent: :destroy		

  # corvo - Added paperclip to Post ( for attaching files ), beneath, conditionals
  has_attached_file :post_img, :styles => { 
                        :s_150 => "150x150>",
  											:m_400 => "400x400>",
                        :m_600 => "600x600>",
                        :l_700 => "700x700>",
  											:l_800s => "800x800>",
                        :l_900 => "900x900>"} #,
  					# :url => "/assets/posts/:id/:style/:basename.:extension",
  					# :path => ":rails_root/:public/assets/posts/:id/:style/:basename.:extension"
            

  # corvo - validations in size and kind
  validates_attachment :post_img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_with AttachmentSizeValidator, :attributes => :post_img, :less_than => 1.megabytes


  def order_post
    self.order = Post.where(project_id: self.project.id).count + 1
    self.save
  end

  def assign_order(index)
    self.order = index 
    self.save
  end
  def reorder_post
    @posts = Post.where(project_id: self.project.id).where.not(order: self.order).order(order: :asc)
    @posts.each do |post|
      post.assign_order(@posts.index(post))
    end    
  end


end
