# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    @user.build_destination
  end
 
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      sign_in @user
      redirect_to root_path
    else
      render :new
    end
  end
 
 def user_params
    params.require(:user).permit(:nickname, :password, :password_confirmation, :email, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date, destination_attributes: [:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number])
 end
end
