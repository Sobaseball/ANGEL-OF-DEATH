class AddColumnImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :images_id, :string
  end
end
