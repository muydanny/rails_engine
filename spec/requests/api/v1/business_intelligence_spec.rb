require 'rails_helper'

describe "Business Intelligence" do
  it "can get merchants with most revenue" do
    create_list(:invoice_item, 7)

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
