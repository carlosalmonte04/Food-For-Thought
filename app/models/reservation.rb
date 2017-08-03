class Reservation < ApplicationRecord
  belongs_to :post
  belongs_to :student, class_name: "User"
  belongs_to :tutor, class_name: "User"
  has_one :rating

  # validate :after_today
  # validate :before_deadline
  # validate :already_reserved

  # def after_today
  # 		if time < Date.today
  # 			errors.add(:time, "Date must be after today!")
  # 		end
  # end

  # def before_deadline
  # 		if time > post.deadline
  # 			errors.add(:time, "Date must be before the deadline!")
  # 		end
  # end

  # def already_reserved
  # 		if post.status != "open"
  # 			errors.add(:post, "Reservation has already been made")
  # 		end
  # end


end
