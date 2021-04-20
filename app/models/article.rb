class Article < ApplicationRecord

  attachment :user_image

  belongs_to :user, optional: true
  has_many :genres
  has_many :article_comments, dependent: :destroy

end
