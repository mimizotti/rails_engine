class Api::V1::Merchants::SearchController < ApplicationController
  def show
    render json: Merchant.random
  end
end
