class ItemsController < ApplicationController
  def index
    @new_items = Item.all.order("created_at desc").limit(10)
    random_category = Item.all.shuffle.take(1)[0][:category_id]
    @pickup_items = Item.where(category: random_category, trading_status: 1).shuffle.take(10)

  end

  def perchase_confirmation
    @item = Item.find(params[:id])
    card = CreditCard.where(user_id: current_user.id)
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      charge = Payjp::Charge.create(
        amount: @item.price,
        customer: card.customer_token,
        currency: 'jpy',
      )
      if @item.update(trading_status: 2, buyer_id: current_user.id)
        redirect_to item_path(@item.id), notice: "#{@item.name}を購入しました。"
      else
        redirect_to item_path(@item.id), notice: "#{@item.name}を購入できませんでした。"
      end
    end
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
  end

end
