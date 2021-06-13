class CreateAnsers < ActiveRecord::Migration[5.2]
  def change
    create_table :ansers do |t|
      t.string :message

      t.timestamps
    end
  end
end
