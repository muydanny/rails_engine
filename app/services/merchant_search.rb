class MerchantSearch

  def self.find_by_fragment(fragment)
    Merchant.where("name ILIKE ?", "%#{fragment}%")
  end

  def self.find_revenue(quantity)  
    Merchant.joins(invoices: [:invoice_items, :transactions])
      .where("transactions.result = 'success'")
      .group("merchants.name")
      .select("merchants.name, sum(invoice_items.quantity * invoice_items.unit_price) as revenue").limit(quantity)
  end

end
