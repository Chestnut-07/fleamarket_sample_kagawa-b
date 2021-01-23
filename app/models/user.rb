class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true

  has_many :items, dependent: :destroy
  has_one :destination, dependent: :destroy
  has_one :credit_card, dependent: :destroy
end
