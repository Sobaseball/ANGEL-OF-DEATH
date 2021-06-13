class Item < ApplicationRecord
    has_many :images, dependent: :destroy, autosave: true
    accepts_attachments_for :images, attachment: :images
    belongs_to :genre
    has_many :cart_items
    has_many :order_item
end
