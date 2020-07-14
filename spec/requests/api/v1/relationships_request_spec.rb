require 'rails_helper'

describe "Relationships API" do
  it "can get get items for a merchant" do

    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
    
    body = JSON.parse(response.body)
    expect(body['data'].count).to eq(merchant.items.count)
  end
end


# it 'can get items for a merchant' do
#       response = conn('/api/v1/merchants/99/items').get
#       json = JSON.parse(response.body, symbolize_names: true)
#       expected_ids =
#       [
#         2397, 2398, 2399, 2400, 2401, 2402, 2403, 2404, 2405, 2406,
#         2407, 2408, 2409, 2410, 2411, 2412, 2413, 2414, 2415, 2416,
#         2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426,
#         2427, 2428, 2429, 2430, 2431, 2432, 2433, 2434, 2435, 2436,
#         2437, 2438
#       ]
#       item_ids = json[:data].map do |item|
#         item[:id].to_i
#       end
#       expect(item_ids.sort).to eq(expected_ids)
#     end