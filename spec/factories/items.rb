FactoryBot.define do
  factory :item do
    name { "ItemName" }
    unit_price { 7.5 }
    merchant 
    description { "MyText" }
  end
end
