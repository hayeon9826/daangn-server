class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :desc
      t.string :image
      t.string :location
      t.string :price

      t.timestamps
    end
  end
end
