class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = current_user
      @selling_item = Item.where(seller_id: current_user.id, trading_status: 1).count
    else
      redirect_to root_path, alert: "ログインしてください。"
    end
  end

  def new
  end

end
