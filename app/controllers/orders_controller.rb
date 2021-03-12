class OrdersController < ApplicationController
  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_purchase = UserPurchase.new(order_params)
    # binding.pry
     if @user_purchase.valid?
      @user_purchase.save
      redirect_to root_path
     else
      render action: :index
     end
  end

  private
  def order_params
    # binding.pry
    params.require(:user_purchase).permit(:purchase_record, :post_code, :area_id, :city, :address, :building_name, :phone_number, :item_id).merge( user_id: current_user.id)
  end

end
