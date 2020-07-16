FactoryBot.define do
  factory :invoice_item do
    quantity {rand(10)}
    association :item
    association :invoice
    unit_price {rand(199..9999)}
  end
end
