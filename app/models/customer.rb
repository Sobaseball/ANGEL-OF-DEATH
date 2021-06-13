class Customer < ApplicationRecord
  acts_as_paranoid
  has_many :cart_items
  has_many :addresses
  has_many :orders
  has_many :inquiries

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_active == true)
  end
end
