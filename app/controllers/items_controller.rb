class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :new]

  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :method_of_payment_id, :area_id, :days_required_id, :price).merge(user_id: current_user.id)
    # params.require(:item).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end