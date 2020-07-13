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
    
    item = build(:item, merchant: merchant)

    post '/api/v1/items', params: item.attributes

    expect(response).to be_successful
    body = response.body 
    response = JSON.parse(body)
    
    expect(response["data"]["attributes"]["name"]).to eq(item.name)
    expect(response["data"]["attributes"]["description"]).to eq(item.description)
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
    updated_item = build(:item, merchant: merchant)

    patch "/api/v1/items/#{item.id}", params: updated_item.attributes
    
    expect(response).to be_successful
    
    expect(item.name).to eq(updated_item.name)
    expect(item.description).to eq(updated_item.description)
    expect(item.unit_price).to eq(updated_item.unit_price)
    expect(merchant.id).to eq(updated_item.merchant_id)
  end
end
