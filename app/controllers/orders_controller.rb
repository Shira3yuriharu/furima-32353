class OrdersController < ApplicationController
  def index
    @order = UserPurchase.new
  end
end
