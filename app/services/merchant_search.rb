class MerchantSearch

  def self.find_by_fragment(fragment)
    Merchant.where("name ILIKE ?", "%#{fragment}%")
  end

end
