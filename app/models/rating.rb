class Rating < ApplicationRecord
  belongs_to :reservation
  validates :value, presence: true
end
