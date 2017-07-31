class User < ApplicationRecord
	has_many :posts, foreign_key: "student_id"
	has_many :student_reservations, class_name: "Reservation", foreign_key: "student_id"
	has_many :tutor_reservations, class_name: "Reservation", foreign_key: "tutor_id"
	has_many :offers, foreign_key: "tutor_id"
	has_many :ratings, through: :tutor_reservations
end
