class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :merchant_id
      t.string :status
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
