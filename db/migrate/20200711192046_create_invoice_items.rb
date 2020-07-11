class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.integer :quantity
      t.integer :unit_price

      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
