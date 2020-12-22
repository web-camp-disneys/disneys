class Address < ApplicationRecord
    belongs_to :customer
    
    # public/order/newでプルダウンの表示に使用
  def view_for_shipping_address
    self.postal_code + self.address + self.name
  end
end
