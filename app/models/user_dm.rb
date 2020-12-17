class UserDm < ApplicationRecord
  belongs_to :user
  belongs_to :dm

  validates :dm_id, uniqueness: { scope: :user_id }
  # validates_uniqueness_of :dm_id, scope: :user_id
end
