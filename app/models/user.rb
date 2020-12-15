class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :plofile
  has_many :messages
  has_many :user_dms #中間テーブル
  has_many :dms, through: :user_dms
  has_many :boards
  has_many :comments
  has_many :scedules

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_ruby
    validates :last_name_ruby
    validates :phone_number
  end
  
  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :first_name
    validates :last_name
  end

  with_options format: {with: /\A[\p{hiragana} ー－&&[^ -~｡-ﾟ]]+\z/} do
    validates :first_name_ruby
    validates :last_name_ruby
  end

  validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/}
  # validates :password, format: {with: /\A[0-9]+\z/}
end
