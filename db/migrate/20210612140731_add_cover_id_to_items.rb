class AddCoverIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :cover_id, :integer, default: 1
  end
end
