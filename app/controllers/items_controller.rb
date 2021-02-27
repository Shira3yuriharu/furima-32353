class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :method_of_payment_id, :area_id,
                                 :day_required_id, :price).merge(user_id: current_user.id)
    # params.require(:item).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
