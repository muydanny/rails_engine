require 'rails_helper'

describe "Items API" do
  it "can get an item" do
    item = create(:item)
    merchant = create(:merchant)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    
    single_item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['name']).to eq(item.name)
    expect(item['description']).to eq(item.description)
    expect(item['unit_price']).to eq(item.unit_price)
    expect(item['merchant_id']).to eq(item.merchant_id)
  end

  it "can get all items" do 
    item = create(:item)
    item = create(:item)
    merchant = create(:merchant)

    get "/api/v1/items"

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.count).to eq(2)
  end
end


# it 'can create and delete an item' do
#         name = "Shiny Itemy Item"
#         description = "It does a lot of things real good"
#         unit_price = 5011.96
#         merchant_id = 43

#         body = {
#           name: name,
#           description: description,
#           unit_price: unit_price,
#           merchant_id: merchant_id
#         }

#         # Create a item
#         response = conn('/api/v1/items').post do |request|
#           request.body = body
#         end

#         json = JSON.parse(response.body, symbolize_names: true)

#         new_item = json[:data]
#         expect(new_item[:attributes][:name]).to eq(name)
#         expect(new_item[:attributes][:description]).to eq(description)
#         expect(new_item[:attributes][:unit_price]).to eq(unit_price)
#         expect(new_item[:attributes][:merchant_id]).to eq(merchant_id)

#         # Delete a item
#         delete_response = conn("/api/v1/items/#{new_item[:id]}").delete

#         json = JSON.parse(delete_response.body, symbolize_names: true)

#         deleted_item = json[:data]
#         expect(deleted_item[:attributes][:name]).to eq(name)
#         expect(deleted_item[:attributes][:description]).to eq(description)
#         expect(deleted_item[:attributes][:unit_price]).to eq(unit_price)
#         expect(deleted_item[:attributes][:merchant_id]).to eq(merchant_id)
#       end