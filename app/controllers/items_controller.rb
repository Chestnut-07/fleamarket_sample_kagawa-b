class ItemsController < ApplicationController
  def index
  end
  
  def show
    # @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end

  def create
  end
end
