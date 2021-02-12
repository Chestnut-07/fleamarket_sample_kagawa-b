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

  validates :nickname,                presence: true, length: {maximum: 20}
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128}
  validates :family_name,             presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :first_name,              presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :family_name_kana,        presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_kana,         presence: true, format: { with: VALID_NAME_REGEX }
  validates :birth_date,              presence: true
  

  has_many :items, dependent: :destroy
  has_one :credit_card, dependent: :destroy
end
