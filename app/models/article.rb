class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :genres
  attachment :user_image
end
