class ItemsController < ApplicationController

  def index
  end

  def perchase_confirmation
  end
  
  def new
    @item = Item.new
    @category = Category.roots
    @item.build_item_image
  end

  def show
    @item = Item.find(params[:id])
  end

  def get_categories
    current_category = Category.find(params[:category_id])
    @children = current_category.children
  end

  def create
    @item = Item.new(item_params)
    @category = Category.all
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id, :preparation_day_id, :price,item_image_attributes: [:image]).merge(seller_id: 1, trading_status: 1)
  end

end
