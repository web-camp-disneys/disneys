class Item < ApplicationRecord
    attachment :image

    belongs_to :genre
    has_many :cart_items
    has_many :order_de

    # 12345678.to_s(:delimited, delimiter: '.')
    #  # => 12.345.678
    # 12345678.to_s(:delimited, delimiter: ',')
    #  # => 12,345,678
end
