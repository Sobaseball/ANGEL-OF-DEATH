class Image < ApplicationRecord
  belongs_to :item
  attachment :images
end
