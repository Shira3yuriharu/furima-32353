class OrdersController < ApplicationController
  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @user_purchase = UserPurchase.new(user_purchase_params)
    @item = Item.find(params[:item_id])
     if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
     else
      render action: :index
     end
  end


  private

  def user_purchase_params
    # binding.pry
    params.require(:user_purchase).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_params[:token],
      currency: 'jpy'
    )
  end

end
