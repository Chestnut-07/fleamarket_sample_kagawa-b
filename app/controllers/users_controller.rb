class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = current_user
    @selling_item = Item.where(seller_id: current_user.id, trading_status: 1).count
  end

  def new
  end

end
