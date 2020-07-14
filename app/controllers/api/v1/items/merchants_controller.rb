class Api::V1::Items::MerchantsController < ApplicationController

  def show
    merchant = Merchant.where(params[:id])
    render json: MerchantSerializer.new(Item.find_by(params[:merchant_id]).merchant)
  end

end

