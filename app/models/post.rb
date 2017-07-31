class Post < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  has_many :offers
  has_many :reservations
end
