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
    expect(body['data']['id']).to eq("#{merchant.id}")
  end

  it "can find a list of merchants that contain a fragment, case insensitive" do 
    merchant1 = create(:merchant, name: "Illmatic" )
    merchant2 = create(:merchant, name: "Lauryn Hill" )
    merchant3 = create(:merchant, name: "Lill Kim" )
    
    get "/api/v1/merchants/find?name=ILL"
    expect(response).to be_successful

    body = JSON.parse(response.body)
    expect(body['data']).to eq(["Illmatic, Lauryn Hill, Lill Kim"])
  end

end


# describe "search endpoints" do
#     xit 'can find a list of merchants that contain a fragment, case insensitive' do
#       response = conn('/api/v1/merchants/find_all?name=ILL').get
#       json = JSON.parse(response.body, symbolize_names: true)

#       names = json[:data].map do |merchant|
#         merchant[:attributes][:name]
#       end

#       expect(names.sort).to eq(["Schiller, Barrows and Parker", "Tillman Group", "Williamson Group", "Williamson Group", "Willms and Sons"])
#     end