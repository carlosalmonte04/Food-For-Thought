class Offer < ApplicationRecord
  belongs_to :post
  belongs_to :tutor, class_name: "User"

  validate :already_offered

  def already_offered
  		if !!Offer.find_by(post: post, tutor: tutor)
  			errors.add(:tutor, "You've already offered your help on this post!")
  		end
  end
end
