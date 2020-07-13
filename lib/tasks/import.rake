desc "Clear records and import CSV fixture data"
task import: :environment do 
  Transaction.destroy_all
  InvoiceItem.destroy_all
  Item.destroy_all
  Invoice.destroy_all
  Merchant.destroy_all
  Customer.destroy_all

  require 'csv'

  puts "Importing customers..."
  CSV.foreach('./data/customers.csv', headers: true, header_converters: :symbol, converters: :all) do |row|
    Customer.create(row.to_h)
  end

  puts "Importing merchants..."
  CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol, converters: :all) do |row|
    Merchant.create(row.to_h)
  end

  puts "Importing invoices..."
  CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol, converters: :all) do |row|
    Invoice.create(row.to_h)
  end
  
  puts "Importing items..."
  CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol, converters: :all) do |row|
    item = Item.create(row.to_h)
    item.unit_price = (row[:unit_price] / 100.00)
    item.save
  end

  puts "Importing invoice items..."
  CSV.foreach('./data/invoice_items.csv', headers: true, header_converters: :symbol, converters: :all) do |row|
    InvoiceItem.create(row.to_h)
  end

  puts "Importing transactions..."
  CSV.foreach('./data/transactions.csv', headers: true, header_converters: :symbol, converters: :all) do |row|
    Transaction.create(row.to_h)
  end

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end

  puts "Successfully imported CSV data to database."
end