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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :categories_id, :item_condition, :shipping_fee_payer_id, :prefecture_id, :preparation_day_id, :price).marge(seller_id: current_user.id)
  end
end
