class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :purchase_confirmation]
  before_action :find_current_item, only: [:purchase_confirmation, :pay, :show]

  def index
    @items = Item.all
    unless @items.blank?
      @new_items = Item.all.order("created_at desc").limit(10)
      selling_items = Item.where(trading_status: 1)
      unless selling_items.blank? 
        random_category = selling_items.shuffle.take(1)[0][:category_id]
        @pickup_items = Item.where(category: random_category, trading_status: 1).shuffle.take(10)
      end
    end
  end

  def purchase_confirmation
    if current_user.id == @item.seller_id
      redirect_to item_path(@item.id), alert: "自身で出品した商品は購入できません。"
    elsif @item.trading_status == 2
      redirect_to item_path(@item.id), alert: "この商品は売り切れです。"
    else
      find_card
      unless @card.blank?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_token)
        @card_info = customer.cards.retrieve(@card.card_token)
        @card_exp = "#{sprintf("%02d",@card_info.exp_month)} / #{@card_info.exp_year%100}"
        @card_logo = "material/pict/#{@card_info.brand}.svg"
      end
    end
  end

  def pay
    find_card
    if @card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        customer: @card.customer_token,
        currency: 'jpy',
      )
      if @item.update(trading_status: 2, buyer_id: current_user.id)
        redirect_to root_path, notice: "#{@item.name}を購入しました。"
      else
        redirect_to item_path(@item.id), notice: "#{@item.name}を購入できませんでした。"
      end
    end
  end

  def new
    @item = Item.new
    @category = Category.roots
    @item.build_item_image
  end

  def show
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
    @items = Item.search(params[:keyword])
  end
  
  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.seller.id
      if item.destroy
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

  def find_current_item
    @item = Item.find(params[:id])
  end

  def find_card
    @card = CreditCard.where(user_id: current_user.id).first
  end

end
