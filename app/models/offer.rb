class Offer < ApplicationRecord
  belongs_to :post
  belongs_to :tutor, class_name: "User"

  validate :already_offered
  validate :same_user

  def already_offered
  		if !!Offer.find_by(post: post, tutor: tutor)
  			errors.add(:tutor, "You've already offered your help on this post!")
  		end
  end

  def same_user
  		if post.student.id == tutor.id
  			errors.add(:tutor, "You can't help yourself!")
  		end
  end
end
