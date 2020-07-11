class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :status
      t.references :customer, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true

      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
