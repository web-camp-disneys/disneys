class Item < ApplicationRecord
    attachment :image
    validates :name, :genre_id, :introduction, :image, :price, presence: true
    validates :is_active, inclusion: { in: [true, false] }

    belongs_to :genre
    has_many :cart_items
    has_many :order_details
end
