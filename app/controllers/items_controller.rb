class ItemsController < ApplicationController
  def index
    @new_items = Item.all.order("created_at desc").limit(10)
    random_category = Item.all.shuffle.take(1)[0][:category_id]
    @pickup_items = Item.where(category: random_category, trading_status: 1).shuffle.take(10)

  end
  def perchase_confirmation
  end
  
  def new
  end

  def show
    @item = Item.find(params[:id])
  end

end
