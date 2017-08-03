class Post < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  has_many :offers
  has_many :reservations
  belongs_to :topic

  validates :deadline, :title, :description, :compensation, :topic, presence: true
  validate :after_now

  def topic_attributes=(top)
	  self.topic = Topic.find_by(top)
	  self.save
  end

  def after_now
    if deadline < Date.today
      errors.add(:deadline, "Date must be today or later")
    end
  end
end
