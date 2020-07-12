require 'rails_helper'

describe "Items API" do
  it "can get an item" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['id']).to eq(id)
  end
end

# describe 'ReST endpoints' do
#     describe 'Items' do
#       it 'can get an item' do
#         response = conn('/api/v1/items/179').get

#         expected_attributes = {
#           name: 'Item Qui Veritatis',
#           description: 'Totam labore quia harum dicta eum consequatur qui. Corporis inventore consequatur. Illum facilis tempora nihil placeat rerum sint est. Placeat ut aut. Eligendi perspiciatis unde eum sapiente velit.',
#           unit_price: 906.17,
#           merchant_id: 9
#         }

#         json = JSON.parse(response.body, symbolize_names: true)

#         expect(json[:data][:id]).to eq('179')

#         expected_attributes.each do |attribute, value|
#           expect(json[:data][:attributes][attribute]).to eq(value)
#         end
#       end