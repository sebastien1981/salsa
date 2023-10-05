class SchoolClass < ApplicationRecord
  belongs_to :school
  validate :check_dates
  validates :beginning_of_time, :end_of_time, presence: true

  def check_dates
    if (beginning_of_time > end_of_time) || (beginning_of_time == end_of_time)
      errors.add(:end_of_time, message: "Ne peut pas être avant, ou égale à la date de début")
    end
  end
end
