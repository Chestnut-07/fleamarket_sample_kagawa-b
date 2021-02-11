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
    @credit_card = CreditCard.new(user: current_user, customer_token: customer.id, card_token: customer.default_card)
  end

end
