

class Api::V1::Merchants::SearchController < ApplicationController

  def find
    
    # @category = Category.find_by_type(params[:category_id])
    merchants = MerchantSearch.find_by_name(params[:name])
    render json: MerchantSerializer.new(merchants).serialized_json
    # merchants = Merchant.where("merchant.name = ?", "ill")
    # merchant = Merchant.where(params[:name])
    # @merchants = merchants.find(:all, :conditions => { :name => params[:name]} ) 
  end

end

# Invoice.joins(:invoice_items, :transactions).where("transactions.result = ?", "success")