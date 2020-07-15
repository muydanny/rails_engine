class Api::V1::Merchants::SearchController < ApplicationController

  def find_all
    merchants = MerchantSearch.find_by_fragment(params[:name])
    render json: MerchantSerializer.new(merchants).serialized_json
  end

end

