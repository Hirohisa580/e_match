class Profile < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one_attached :image
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :favorites, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :genre_one
  belongs_to :genre_two
  belongs_to :genre_three

  with_options presence: true do
    validates :nickname
    validates :public_relation
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :genre_one_id
  end

  with_options format: {with: /\A[0-9]+\z/} , allow_nil: true do
    validates :age
    validates :history
  end
end
