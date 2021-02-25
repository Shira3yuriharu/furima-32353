class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :new]

  def index
  end

  def new
    if user_signed_in?
      @items = Item.new
    else
      redirect_to user_session_path
  end
  
end
