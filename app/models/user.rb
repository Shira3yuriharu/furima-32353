class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # validates :email, uniqueness: true #←validates :email, presence: trueの記述は内部的にされている為
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :birthday, presence: true

  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGEX }

  # アソシエーションは他モデルを作成したら記述する？
end
