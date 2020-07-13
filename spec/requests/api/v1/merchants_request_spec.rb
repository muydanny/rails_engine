require 'rails_helper'

describe "Merchants API" do
  it "can get a merchant" do

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
end

# describe 'Merchants' do
#       xit 'can get a merchant' do
#         response = conn('/api/v1/merchants/42').get

#         expected_attributes = {
#           name: 'Glover Inc',
#         }

#         json = JSON.parse(response.body, symbolize_names: true)

#         expect(json[:data][:id]).to eq('42')

#         expected_attributes.each do |attribute, value|
#           expect(json[:data][:attributes][attribute]).to eq(value)
#         end
#       end

#       xit 'can get all merchants' do
#         response = conn('/api/v1/merchants').get
#         json = JSON.parse(response.body, symbolize_names: true)

#         expect(json[:data].length).to eq(100)
#         json[:data].each do |merchant|
#           expect(merchant[:type]).to eq("merchant")
#           expect(merchant[:attributes]).to have_key(:name)
#         end
#       end