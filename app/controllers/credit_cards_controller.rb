class CreditCardsController < ApplicationController
  def index
  end

  def new
    @exp_year = []
    11.times do |i|
      today_year = Date.today.year % 100
      @exp_year << today_year + i
    end
  end

end
