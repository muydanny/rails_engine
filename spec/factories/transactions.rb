FactoryBot.define do
  factory :transactions do
    creadit_card_number {rand(4000000000000000..5000000000000000)}
    credit_card_expiration_date { " " }
    result {rand("success", "failed")}
    association :invoice
  end
end