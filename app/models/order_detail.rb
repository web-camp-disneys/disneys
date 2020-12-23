class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum making_status: { 制作不可: 0, 制作待ち: 1, 制作中: 2, 製作完了: 3 }
    validates :order_id, :item_id, :price, :amount, :making_status, presence: true
end
