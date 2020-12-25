class Item < ApplicationRecord
    attachment :image
    validates :name, :genre_id, :introduction, :price, presence: true

    belongs_to :genre
    has_many :cart_items
    has_many :order_details
end
