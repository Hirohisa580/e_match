class Message < ApplicationRecord
  belongs_to :profile
  belongs_to :dm
  belongs_to :user

  validates :message, presence: true
end
