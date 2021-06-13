class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :freight
      t.integer :subtotal
      t.integer :payment
      t.string :superscription
      t.string :shipping_address
      t.string :shipping_postalcode
      t.boolean :is_oder
      t.timestamp :create_at
      t.timestamp :update_at
      t.integer :is_oder
      t.integer :customer_id


      t.timestamps
    end
  end
end