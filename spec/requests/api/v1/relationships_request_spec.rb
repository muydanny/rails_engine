require 'rails_helper'

describe "Relationships API" do
  it "can get get items for a merchant" do

    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    item = create(:item, merchant: merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
    
    body = JSON.parse(response.body)
    expect(body['data'].count).to eq(merchant.items.count)
  end

  it "can get merchant for an item" do 

    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    body = JSON.parse(response.body)
    expect(body['data']['id']).to eq(merchant.id)
  end

end


# it 'can get merchant for an item' do
#       response = conn('/api/v1/items/209/merchant').get
#       json = JSON.parse(response.body, symbolize_names: true)
#       expected_id = '11'

#       expect(json[:data][:id]).to eq(expected_id)
#     end