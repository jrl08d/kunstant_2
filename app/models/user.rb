class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :goals
	has_many :projects
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationships",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '125x125#',
    medium: '300x300>'
    }, :default_url => "/images/:style/missing.png"
 
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def already_following?(other_user)
    Relationship.where(follower_id: self.id, followed_id: other_user.id).exists?
  end

  def is_following # show me the relationship where the user is the follower return their relatioship. Returns an array of all the relationship where they are the follower 
    unless Relationship.where(follower_id: self.id).empty?
      return Relationship.where(follower_id: self.id)
    end
    []
  end

  def followed_by #show me the relationship where the user is being followed. Returns an array of all the relationships where the user is being followed.
    unless Relationship.where(followed_id: self.id).empty?
      return Relationship.where(followed_id: self.id)
    end
    []
  end
    
end
