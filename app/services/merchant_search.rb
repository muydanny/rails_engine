class MerchantSearch

  def self.find_by_name(fragment)
    Merchant.where("name ILIKE ?", "%#{fragment}%")
  end

end
