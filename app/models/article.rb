class Article < ApplicationRecord
  attachment :user_image

  belongs_to :user, optional: true
  belongs_to :genre, optional: true
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :genre,
            presence: true
  
  
  validates :title,
            presence: true,
            length: { maximum: 8 }

  validates :body,
            presence: true,
            length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
