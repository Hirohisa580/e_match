class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :board
  belongs_to :user
end
