class Offer < ApplicationRecord
  belongs_to :post
  belongs_to :tutor, class_name: "User"
end
