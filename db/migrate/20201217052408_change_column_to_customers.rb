# 12/17タネサカ　下記変更を加えました。
class ChangeColumnToCustomers < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :customers, :is_deleted, :boolean, default: true
  end

  # 変更前の状態
  def down
    change_column :customers, :is_deleted, :boolean, default: false
  end
end
