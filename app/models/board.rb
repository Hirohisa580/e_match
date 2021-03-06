class Board < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  has_many :comments, dependent: :destroy


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_one

  with_options presence: true do
    validates :name
    validates :explanation
  end

  validates :genre_one_id, numericality: { other_than: 1 }
end
