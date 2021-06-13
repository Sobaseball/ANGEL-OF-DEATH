class AddCustomerIdToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :customer_id, :integer
  end
end
