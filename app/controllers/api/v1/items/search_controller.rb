class Api::V1::Items::SearchController < ApplicationController

  def index
    items = ItemSearch.find_by_fragment(params[:name])
    render json: ItemSerializer.new(items).serialized_json
  end

  def show
    items = ItemSearch.find_by_fragment(params[:name]).first
    render json: ItemSerializer.new(items).serialized_json
  end

end