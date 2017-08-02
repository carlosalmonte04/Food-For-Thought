class Post < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  has_many :offers
  has_many :reservations
  belongs_to :topic


  def topic_attributes=(top)
	  self.topic = Topic.find_by(top)
	  self.save
  end
end
