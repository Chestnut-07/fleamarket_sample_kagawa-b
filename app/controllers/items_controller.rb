class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
    @category = Category.roots
  end

  def show
    @item = Item.find(params[:id])
  end

end
