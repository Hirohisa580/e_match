class Schedule < ApplicationRecord
   
   belongs_to :user
   belongs_to :profile

   with_options presence: true do
      validates :title
   end
end
