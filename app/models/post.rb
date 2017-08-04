class Post < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  has_many :offers
  has_many :reservations
  belongs_to :topic

  validates :deadline, :title, :description, :compensation, :topic, presence: true
  validate :valid_date

  def topic_attributes=(top)
	  self.topic = Topic.find_by(top)
	  self.save
  end

  def valid_date
    if deadline.empty? || deadline < Date.today
      errors.add(:deadline, "Date is not valid")
    end
  end
end
