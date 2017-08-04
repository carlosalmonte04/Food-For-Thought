class User < ApplicationRecord
	has_many :posts, foreign_key: "student_id"
	has_many :student_reservations, class_name: "Reservation", foreign_key: "student_id"
	has_many :tutor_reservations, class_name: "Reservation", foreign_key: "tutor_id"
	has_many :offers, foreign_key: "tutor_id"
	has_many :ratings, through: :tutor_reservations

	validates :username, :first_name, :last_name, :email, :slack_id, presence: true

	def full_name
		[self.first_name, self.last_name].join(" ")
	end

	def avg_rating
		if self.ratings.present?
			self.ratings.pluck(:value).map(&:to_f).reduce(:+)/self.ratings.count
		else
			"N/A"
		end
	end
end
