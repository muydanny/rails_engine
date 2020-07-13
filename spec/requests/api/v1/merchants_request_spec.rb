require 'rails_helper'

describe "Merchants API" do
  it "can get a merchant" do

    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful
    
    single_item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['name']).to eq(merchant.name)
  end

  it "can get all merchants" do 
    merchant = create(:merchant)
    merchant = create(:merchant)
    
    get "/api/v1/merchants"
    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body["data"].count).to eq(2)
  end

  it "can create an item" do  
    merchant = build(:merchant)

    post '/api/v1/merchants', params: merchant.attributes

    expect(response).to be_successful
    body = response.body 
    response = JSON.parse(body)
    expect(response["data"]["attributes"]["name"]).to eq(merchant.name)
  end

  it "can delete an item" do 
    merchant = create(:merchant)
    expect(Merchant.count).to eq(1)

    expect{ delete "/api/v1/merchants/#{merchant.id}" }.to change(Merchant, :count).by(-1)

    expect(response).to be_successful
    expect(Merchant.count).to eq(0)
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can update an item"  do 
    merchant = create(:merchant)
    updated_merchant = build(:merchant)

    patch "/api/v1/merchants/#{merchant.id}", params: updated_merchant.attributes
    
    expect(response).to be_successful
    
    expect(merchant.name).to eq(updated_merchant.name)
  end
end

