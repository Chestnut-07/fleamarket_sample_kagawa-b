class CreditCardsController < ApplicationController
  before_action :prepare_card, only: [:show, :destroy]
  before_action :redirect_show, only: [:index] 
  
  require "payjp"

  def index
  end

  def new
    if !user_signed_in?
      redirect_to root_path, alert: "ログインしてください。"
    else
      redirect_show
      gon.payjp_public_key = ENV["PAYJP_PUBLIC_KEY"]
      @credit_card = CreditCard.new
      @exp_year = []
      11.times do |i|
        today_year = Date.today.year % 100
        @exp_year << today_year + i
      end
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      card: params["card_token"],
      metadata: {user_id: current_user.id}
    )
    @credit_card = CreditCard.new(user: current_user, customer_token: customer.id, card_token: customer.default_card)
    if @credit_card.save
      redirect_to credit_card_path(current_user), notice: "カード情報が登録されました。"
    else
      redirect_to new_credit_card_path, alert: "カード情報が登録できませんでした。"
    end
  end

  def show
    if @card.blank?
      redirect_to action: "index"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_token)
      @card_info = customer.cards.retrieve(@card.card_token)
      @card_exp = "#{sprintf("%02d",@card_info.exp_month)} / #{@card_info.exp_year%100}"
      @card_logo = "material/pict/#{@card_info.brand}.svg"
    end
  end

  def destroy
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_token)
    customer.delete
    if @card.destroy
      redirect_to credit_cards_path, notice: "カード情報が削除されました。"
    else
      redirect_to credit_cards_path, alert: "カード情報を削除できませんでした。"
    end
  end

  private
  def prepare_card
    @card = CreditCard.where(user_id: current_user.id).first
  end

  def redirect_show
    credit_card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user) if credit_card.exists?
  end
end
