class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices 
  has_many :transactiions, through: :invoices
end