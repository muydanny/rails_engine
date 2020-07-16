require 'rails_helper'

describe "Business Intelligence" do
  it "can get merchants with most revenue" do

    merchant1 = create(:merchant)
    item1 = create(:item, merchant: merchant1)
    invoice1 = 
    merchant2 = create(:merchant)
    item2 = create(:item, merchant: merchant2)
    merchant3 = create(:merchant)
    item3 = create(:item, merchant: merchant3)

    get "/api/v1/merchants/most_revenue?quantity=7"

    expect(response).to be_successful
    json = JSON.parse(response.body)
    require 'pry'; binding.pry
    expect(json[:data].length).to eq(7)
    expect(json[:data][0][:attributes][:name]).to eq(merchant1.name)
    expect(json[:data][0][:id]).to eq(merchant1.id)
    expect(json[:data][3][:attributes][:name]).to eq(merchant2.name)
    expect(json[:data][3][:id]).to eq(merchant2.id)
    expect(json[:data][6][:attributes][:name]).to eq(merchant3.name)
    expect(json[:data][6][:id]).to eq(merchant3.id)
  end

end



# describe 'business intelligence' do
#     it 'can get merchants with most revenue' do
#       response = conn("/api/v1/merchants/most_revenue?quantity=7").get
#       json = JSON.parse(response.body, symbolize_names: true)

#       expect(json[:data].length).to eq(7)

#       expect(json[:data][0][:attributes][:name]).to eq("Dicki-Bednar")
#       expect(json[:data][0][:id]).to eq("14")

#       expect(json[:data][3][:attributes][:name]).to eq("Bechtelar, Jones and Stokes")
#       expect(json[:data][3][:id]).to eq("10")

#       expect(json[:data][6][:attributes][:name]).to eq("Rath, Gleason and Spencer")
#       expect(json[:data][6][:id]).to eq("53")
#     end