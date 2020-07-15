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
    merchant4 = create(:merchant, name: "Jedi Mind Tricks" )
    
    get "/api/v1/merchants/find_all?name=ILL"
    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)
    names = body[:data].map do |merchant|
      merchant[:attributes][:name]
    end
    
    expect(names).to eq(["Illmatic", "Lauryn Hill", "Lill Kim"])
    expect(names).to_not eq(["Jedi Mind Tricks"])
  end

  it "can find a merchants that contain a fragment, case insensitive" do 
    merchant = create(:merchant, name: "Illmatic")

    get '/api/v1/merchants/find?name=ILL'
    body = JSON.parse(response.body, symbolize_names: true)
    
    name = body[:data][0][:attributes][:name].downcase
    expect(body[:data]).to be_a(Array)
    expect(name).to include('ill') 
    # TODO need to expect data to be a hash not array
  end

  it "can find a list of items that contain a fragment, case insensitive" do 
    merchant = create(:merchant)
    item = create(:item, name: 'harujuku girls', merchant: merchant)
    item2 = create(:item, name: 'harumonica', merchant: merchant)
    item3 = create(:item, name: 'Avocado Basil Ice Cream', merchant: merchant)

    get '/api/v1/items/find_all?name=haru'

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)
    names = body[:data].map do |merchant|
      merchant[:attributes][:name]
    end
    
    expect(names).to eq(["harujuku girls", "harumonica"])
    expect(names).to_not eq(["Jedi Mind Tricks"])

  end
  

end

# it 'can find a list of items that contain a fragment, case insensitive' do
#       response = conn('/api/v1/items/find_all?name=haru').get
#       json = JSON.parse(response.body, symbolize_names: true)

#       names = json[:data].map do |merchant|
#         merchant[:attributes][:name].downcase
#       end

#       expect(names.count).to eq(18)
#       names.each do |name|
#         expect(name).to include('haru')
#       end
#     end