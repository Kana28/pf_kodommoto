class Article < ApplicationRecord
  belongs_to :user, optional: true
  attachment :user_image
end
