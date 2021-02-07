class ItemsController < ApplicationController
  def index
  end
  def perchase_confirmation
  end
  
  def new
  end

  def show
    @item = Item.find(params[:id])
  end

end
