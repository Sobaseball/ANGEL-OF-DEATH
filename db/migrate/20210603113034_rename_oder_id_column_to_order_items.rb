class RenameOderIdColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :oder_id, :order_id
  end
end
