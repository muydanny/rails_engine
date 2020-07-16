class ItemSearch

  def self.find_by_fragment(fragment)
    Item.where("name ILIKE ?", "%#{fragment}%")
  end

end