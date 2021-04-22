class Article < ApplicationRecord

  attachment :user_image

  belongs_to :user, optional: true
  has_many :genres
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  validates :title, presence: true
  validates :body, presence: true
  

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
