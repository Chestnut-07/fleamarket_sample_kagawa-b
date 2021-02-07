class ItemsController < ApplicationController

  def index
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
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end
