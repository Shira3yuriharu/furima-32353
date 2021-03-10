class OrdersController < ApplicationController
  def index
    @order = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new
    binding.pry
  end

end
