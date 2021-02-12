class CreditCardsController < ApplicationController
  require "payjp"

  def index
  end

  def new
    gon.payjp_public_key = ENV["PAYJP_PUBLIC_KEY"]
    @credit_card = CreditCard.new
    @exp_year = []
    11.times do |i|
      today_year = Date.today.year % 100
      @exp_year << today_year + i
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      card: params["card_token"],
      metadata: {user_id: current_user.id}
    )
    @credit_card = CreditCard.new(user: current_user, customer_token: customer.id, card_token: customer.default_card)
    @credit_card.save
  end

  def show
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card_info = customer.cards.retrieve(card.card_token)
  end

end
