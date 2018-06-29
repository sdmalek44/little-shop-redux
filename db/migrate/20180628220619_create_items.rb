class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :image
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
