class ChangeDefaultStatusofOrders < ActiveRecord::Migration[5.2]
def up
  change_column :orders, :status,:integer, default: 0
  change_column :orders, :payment_method,:integer, default: 0
end

def down
  change_column :orders, :status,:integer
  change_column :orders, :payment_method,:integer
end
end
