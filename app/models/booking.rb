class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :date, presence: true
end
