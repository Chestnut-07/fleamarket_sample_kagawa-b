class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :destination, dependent: :destroy
  accepts_nested_attributes_for :destination

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_ZENKAKU_REGEX =               /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_REGEX =                  /\A[ァ-ヶー－]+\z/


  with_options presence: true do
    validates :birth_date
    validates :nickname,                length: {maximum: 20}
    validates :email,                   uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    with_options length: {minimum: 7, maximum: 128} do
      validates :password
      validates :password_confirmation
    end
    with_options format: { with: VALID_ZENKAKU_REGEX } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: VALID_NAME_REGEX } do
      validates :family_name_kana       
      validates :first_name_kana
    end
  end

  has_many :items, dependent: :destroy
  has_one :credit_card, dependent: :destroy
end
