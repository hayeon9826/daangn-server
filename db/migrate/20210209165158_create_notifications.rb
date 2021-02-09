class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.references :user
      t.references :item

      t.timestamps
    end
  end
end
