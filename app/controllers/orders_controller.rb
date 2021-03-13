class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :redirect, only: [:index]
  before_action :redirectSold, only: [:index]

  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(user_purchase_params)
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
    params.require(:user_purchase).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect
    redirect_to items_path if @item.user.id == current_user.id
  end

  def redirectSold
    redirect_to items_path unless @item.purchase_record.nil?
  end
end
