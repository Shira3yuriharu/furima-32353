class PurchaseRecordsController < ApplicationController
  def index
    @user_purchase = UserPurchase.new
  end

end
