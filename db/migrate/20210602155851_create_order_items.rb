class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :oder_id
      t.integer :item_id
      t.integer :amount
      t.integer :is_production
      t.integer :price_at

      t.timestamps
    end
  end
end
