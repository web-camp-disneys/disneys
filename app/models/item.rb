class Item < ApplicationRecord
    attachment :image
    validates :name, :genre_id, :introduction, :image, :price, :is_active, presence: true

    belongs_to :genre
    has_many :cart_items
    has_many :order_de
end
