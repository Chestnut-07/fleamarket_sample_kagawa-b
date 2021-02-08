class ItemsController < ApplicationController
  def index
    @item = Item.find(1)
    @new_items = Item.all.order("created_at desc").limit(10)
  end
  
  def new
  end

  def show
    @item = Item.find(params[:id])
  end

end
