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
    body = JSON.parse(response.body)
    expect(body["data"].count).to eq(2)
  end

  it "can create an item" do 
    merchant = create(:merchant)
    item_params = {name: "Shiny Itemy Item", description: "I want to play a game", unit_price: 5011.96, merchant_id: merchant.id}

    post '/api/v1/items', params: {item: item_params}
    item = Item.last

    expect(response).to be_successful
    
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.unit_price).to eq(item_params[:unit_price])
    expect(item.merchant_id).to eq(item_params[:merchant_id])
  end

  it "can delete an item" do 
    merchant = create(:merchant)
    item = create(:item)
    expect(Item.count).to eq(1)

    expect{ delete "/api/v1/items/#{item.id}" }.to change(Item, :count).by(-1)

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can update an item"  do 
    merchant = create(:merchant)
    item = create(:item)
    previous_item = Item.last 
    item_params = {name: "Shiny Itemy Item", description: "I want to play a game", unit_price: 5011.96, merchant_id: merchant.id}

    put "/api/v1/items/#{item.id}", params: {item: item_params}

    updated_item = Item.find_by(id: item.id)
    
    expect(response).to be_successful
    expect(updated_item.name).to_not eq(previous_item)
    expect(updated_item.name).to eq(item_params[:name])
    expect(updated_item.description).to eq(item_params[:description])
    expect(updated_item.unit_price).to eq(item_params[:unit_price])
    expect(updated_item.merchant_id).to eq(item_params[:merchant_id])
  end
end


# it 'can update an item' do
#         name = "Shiny Itemy Item"
#         description = "It does a lot of things real good"
#         unit_price = 5011
#         merchant_id = 43

#         body = {
#           name: name,
#           description: description,
#           unit_price: unit_price,
#           merchant_id: merchant_id
#         }

#         response = conn('/api/v1/items/75').patch do |request|
#           request.body = body
#         end

#         json = JSON.parse(response.body, symbolize_names: true)
#         item = json[:data]
#         expect(item[:attributes][:name]).to eq(name)
#         expect(item[:attributes][:description]).to eq(description)
#         expect(item[:attributes][:unit_price]).to eq(unit_price)
#         expect(item[:attributes][:merchant_id]).to eq(merchant_id)

#         original_body = {
#           name: 'Item Autem Eligendi',
#           description:'Aliquam dolores dolore voluptas nesciunt non praesentium. Eum nihil repellendus modi. Aut in expedita nesciunt. Ut aliquam dicta omnis voluptas.',
#           unit_price: '29949',
#           merchant_id: '3',
#         }
#         conn("/api/v1/items/").patch do |request|
#           request.body = original_body
#         end
#       end