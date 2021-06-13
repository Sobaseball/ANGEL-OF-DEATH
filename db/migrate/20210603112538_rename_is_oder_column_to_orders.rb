class RenameIsOderColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :is_oder, :is_order
  end
end
