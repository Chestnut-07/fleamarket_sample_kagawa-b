class ItemsController < ApplicationController
  def index
    @new_items = Item.all.order("created_at desc").limit(10)
  end
  
  def new
  end

  def show
    @item = Item.find(params[:id])
  end

end
