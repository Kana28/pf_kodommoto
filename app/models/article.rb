class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :genres, dependent: :destroy
  attachment :user_image
end
