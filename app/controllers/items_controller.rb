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

  def get_categories
    cuurent_category = Category.find(params[:id])
    @children = current_category.children
  end

end
