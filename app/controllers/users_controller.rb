class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def mypage
    @user = current_user
    @selling_item = Item.where(seller_id: current_user.id, trading_status: 1).count
  end

end
