class Api::V1::Merchants::SearchController < ApplicationController

  def index
    merchants = MerchantSearch.find_by_fragment(params[:name])
    render json: MerchantSerializer.new(merchants).serialized_json
  end

  def show
    merchants = MerchantSearch.find_by_fragment(params[:name]).first
    render json: MerchantSerializer.new(merchants).serialized_json
  end

end

