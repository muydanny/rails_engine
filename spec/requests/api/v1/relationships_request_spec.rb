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

  

end


