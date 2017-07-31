class Reservation < ApplicationRecord
  belongs_to :post
  belongs_to :student, class_name: "User"
  belongs_to :tutor, class_name: "User"
  has_one :rating
end
