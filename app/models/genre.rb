class Genre < ApplicationRecord
  belongs_to :article, optional: true
end
