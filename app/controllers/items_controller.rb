class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def index
    @new_items = Item.all.order("created_at desc").limit(10)
    random_category = Item.all.shuffle.take(1)[0][:category_id]
    @pickup_items = Item.where(category: random_category, trading_status: 1).shuffle.take(10)

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
    if @item.valid? && @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @items = Items.search(params[:keyword])
  end
  
  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      if @item.destroy
        redirect_to root_path
      else
        render :show
      end
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id, :preparation_day_id, :price,item_image_attributes: [:image]).merge(seller_id: current_user.id, trading_status: 1)
  end

end