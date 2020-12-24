class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :amount,:item_id,:customer_id, presence: true
end